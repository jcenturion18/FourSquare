//
//  FourSquareService.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/14/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class FourSquareService {
    let sessionManager:SessionManager
    
    let clientId = "FS1TPI1BMSFSJ020DA4NH1PXD1HW50GYDQYYGQMTLPPCV1YE"
    let clientSecret = "55V42KYJCFKS0AH3EFGI4RKGURAS2KBH3MZG2OV1PE5HONQV"

    init(sessionManager:SessionManager = SessionManager.default) {
        self.sessionManager = sessionManager
    }
    
    
    func fetchVenues(forLocation location:CLLocation,  completion: @escaping ([Venue]?, Error?) -> Void ){
        
        var params = Parameters()
        params["ll"] = location.toString()
        params["client_id"] = clientId
        params["client_secret"] = clientSecret
        params["v"] = actualDate()
        
        sessionManager.request("https://api.foursquare.com/v2/venues/search", method: .get, parameters: params).responseJSON { response in
            
            switch response.result {
            case .success:
                if let data = response.data{
                    do {
                        let JSON = try JSONDecoder().decode(SearchResult.self, from: data)
                        let venues = JSON.response.venues
                        completion(venues, nil)
                    } catch {
                        print("Error processing data \(error)")
                        completion(nil, error)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchVenueDetails(forId id:String, completion: @escaping (Venue?, Error?) -> Void ){
        var params = Parameters()
        params["client_id"] = clientId
        params["client_secret"] = clientSecret
        params["v"] = actualDate()
        
        let path = "https://api.foursquare.com/v2/venues/\(id)"
        
        sessionManager.request(path, method: .get, parameters: params).responseJSON { response in
            
            switch response.result {
            case .success:
                if let data = response.data{
                    do {
                        let JSON = try JSONDecoder().decode(VenueDetailResult.self, from: data)
                        let venue = JSON.response.venue
                        completion(venue, nil)
                    } catch {
                        print("Error processing data \(error)")
                        completion(nil, error)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func actualDate () -> String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        let formattedDate = format.string(from: date)
        return formattedDate
    }
}


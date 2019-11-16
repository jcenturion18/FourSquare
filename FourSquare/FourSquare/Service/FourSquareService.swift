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

    init(sessionManager:SessionManager = SessionManager.default) {
        self.sessionManager = sessionManager
    }
    
    
    func venues(forLocation location:CLLocation,  completion: @escaping ([Venue]?, Error?) -> Void ){
        
        var params = Parameters()
        params["ll"] = "40.74224,-73.99386"
        params["client_id"] = "FS1TPI1BMSFSJ020DA4NH1PXD1HW50GYDQYYGQMTLPPCV1YE"
        params["client_secret"] = "55V42KYJCFKS0AH3EFGI4RKGURAS2KBH3MZG2OV1PE5HONQV"
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
    
    private func actualDate () -> String{
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        let formattedDate = format.string(from: date)
        return formattedDate
    }
}


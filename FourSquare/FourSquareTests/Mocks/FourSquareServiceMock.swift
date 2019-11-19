//
//  FourSquareServiceMock.swift
//  FourSquareTests
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import MapKit
@testable import FourSquare

class FourSquareServiceMock: FourSquareService {
    override func fetchVenues(forLocation location: CLLocation, completion: @escaping ([Venue]?, Error?) -> Void) {
        let venue = VenueMock.venue()
        completion([venue], nil)
    }
    
    override func fetchVenueDetails(forId id: String, completion: @escaping (Venue?, Error?) -> Void) {
        let venue = loadVenueMock(from: "VenueDetail")
        completion(venue, nil)
    }
}


extension FourSquareServiceMock {
    func loadVenueMock(from fileNane:String)->Venue?{
        
        if let path = Bundle.main.path(forResource: fileNane, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let JSON = try JSONDecoder().decode(VenueDetailResult.self, from: data)
                return JSON.response.venue
                
            } catch {
                // handle error
            }
        }
        return nil
    }
}

//
//  DetailVenueViewController.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueViewController: UIViewController {

    let fourSquareService:FourSquareService
    var venue:Venue
    
    init(venue:Venue, fourSquareService:FourSquareService = FourSquareService()){
        self.fourSquareService = fourSquareService
        self.venue = venue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fourSquareService.fetchVenueDetails(forId: venue.id) { (venue, error) in
            if let venue = venue{
                debugPrint(venue)
            }
        }
    }
}

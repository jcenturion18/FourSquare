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
    private(set) var venuePresenter:DetailVenuePresenter?
    
    @IBOutlet weak var stackView: UIStackView!
    init(venue:Venue, fourSquareService:FourSquareService = FourSquareService(),
         venuePresenter:DetailVenuePresenter = DetailVenuePresenter()){
        self.fourSquareService = fourSquareService
        self.venue = venue
        self.venuePresenter = venuePresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        venuePresenter?.setUp(basicVenue: venue, stackView: stackView)
        self.fourSquareService.fetchVenueDetails(forId: venue.id) { (venue, error) in
            if let venue = venue{
                debugPrint(venue)
            }
        }
    }
}

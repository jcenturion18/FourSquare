//
//  DetailVenueTitleBuilder.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueTitleBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        let title:UILabel = UILabel()
        title.text = venue.name
        title.font = UIFont.boldSystemFont(ofSize: 18)
        return title
    }
}

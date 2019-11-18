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
        let titleView:DetailVenueTitle = DetailVenueTitle.loadNib()
        titleView.setTitle(venue.name)
        return titleView
    }
}

//
//  DetailVenueRating.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueRatingBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        guard let rating = venue.rating else { return nil }
        let ratingView:DetailVenueRating = DetailVenueRating.loadNib()
        
        ratingView.setRating("\(rating)")
        if let ratingColor = venue.ratingColor{
            let color = UIColor(hexString: ratingColor)
            ratingView.setFontColor(color)
        }
        return ratingView
    }
}

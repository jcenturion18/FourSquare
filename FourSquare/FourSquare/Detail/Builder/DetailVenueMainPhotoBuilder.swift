//
//  DetailVenueMainPhotoBuilder.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueMainPhotoBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        
        let photoView:DetailVenueMainPhoto = DetailVenueMainPhoto.loadNib()
        
        if let bestPhoto = venue.bestPhoto {
            let url = "\(bestPhoto.prefix)original\(bestPhoto.suffix)"
            photoView.url(url)
        }
        
        return photoView
    }
}

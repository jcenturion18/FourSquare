//
//  DetailVenueLikesBuilder.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueLikesBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        guard let likes = venue.likes else { return nil }
        let likesView:DetailVenueLikes = DetailVenueLikes.loadNib()
        
        likesView.setLikes(likes.summary)
        return likesView
    }
}

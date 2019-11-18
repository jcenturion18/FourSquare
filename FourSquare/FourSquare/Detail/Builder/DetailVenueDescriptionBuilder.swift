//
//  DetailVenueDescriptionBuilder.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueDescriptionBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        guard let description = venue.description else { return nil }
        let descriptionView:DetailVenueDescription = DetailVenueDescription.loadNib()
        
        descriptionView.setDescription(description)
        return descriptionView
    }
}

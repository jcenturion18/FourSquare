//
//  DetailVenueAddressBuilder.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/19/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueAddressBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        guard let formattedAddress = venue.location.formattedAddress else { return nil }
        let addressView:DetailVenueAddress = DetailVenueAddress.loadNib()
        
        addressView.setAddress(formattedAddress.joined(separator: ", "))
        
        return addressView
        
    }
}

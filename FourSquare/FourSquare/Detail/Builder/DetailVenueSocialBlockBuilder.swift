//
//  DetailVenueSocialBlockBuilder.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/19/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueSocialBlockBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        
        let builders:[DetailVenueBuilderProtocol] = [DetailVenueFacebookBuilder(),DetailVenueInstagramBuilder(),DetailVenueTwitterBuilder()]
        
        let views:[UIView] = builders.compactMap { (builder) -> UIView? in
            return builder.build(venue: venue)
        }
        
        if views.count == 0 {
            return nil
        }
        
        let detailView:DetailVenueSocialBlock = DetailVenueSocialBlock.loadNib()
        views.forEach { (view) in
            detailView.stackView?.addArrangedSubview(view)
        }
        
        return detailView
        
    }
}

class DetailVenueFacebookBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        guard let contact = venue.contact, let facebook = contact.facebook else { return nil }
        let socialButtonView:VenueDetailSocialButton = VenueDetailSocialButton.loadNib()
        
        socialButtonView.setImage(UIImage(named: "Facebook")!)
        socialButtonView.setLink("https://facebook.com/profile.php?id=\(facebook)")
        return socialButtonView
    }
}

class DetailVenueInstagramBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        guard let contact = venue.contact, let instagram = contact.instagram else { return nil }
        let socialButtonView:VenueDetailSocialButton = VenueDetailSocialButton.loadNib()
        
        socialButtonView.setImage(UIImage(named: "Instagram")!)
        socialButtonView.setLink("https://www.instagram.com/\(instagram)")
        
        return socialButtonView
    }
}

class DetailVenueTwitterBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        guard let contact = venue.contact, let twitter = contact.twitter else { return nil }
        let socialButtonView:VenueDetailSocialButton = VenueDetailSocialButton.loadNib()
        
        socialButtonView.setImage(UIImage(named: "Twitter")!)
        socialButtonView.setLink("https://twitter.com/\(twitter)")
        
        return socialButtonView
    }
}

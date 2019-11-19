//
//  DetailVenuePresenter.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenuePresenter {

    private var builders:Array<DetailVenueBuilderProtocol>
    private var stackView:UIStackView?
    init() {
        builders = []
        builders.append(DetailVenueMainPhotoBuilder())
        builders.append(DetailVenueTitleBuilder())
        builders.append(DetailVenueAddressBuilder())
        builders.append(DetailVenueDescriptionBuilder())
        builders.append(DetailVenueRankingBuilder())
        builders.append(DetailVenueSocialBlockBuilder())
    }
    
    func setUp(stackView:UIStackView) -> Void {
        self.stackView = stackView
    }
    func updateView(withVenue venue:Venue) -> Void {
        let views:[UIView] = builders.compactMap { (builder) -> UIView? in
            return builder.build(venue: venue)
        }
        views.forEach { (view) in
            stackView?.addArrangedSubview(view)
        }
    }
}

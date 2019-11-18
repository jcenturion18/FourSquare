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
    init() {
        builders = []
        builders.append(DetailVenueTitleBuilder())
    }
    
    func setUp(basicVenue venue:Venue, stackView:UIStackView) -> Void {
        
        stackView.spacing = 8
        
        let views:[UIView] = builders.compactMap { (builder) -> UIView? in
            return builder.build(venue: venue)
        }
        views.forEach { (view) in
            stackView.addArrangedSubview(view)
        }
        
    }
    func updateView(withVenue venue:Venue) -> Void {
        
    }
}

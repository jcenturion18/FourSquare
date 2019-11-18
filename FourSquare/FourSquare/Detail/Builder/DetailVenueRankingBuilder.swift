//
//  DetailVenueRanking.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueRankingBuilder: DetailVenueBuilderProtocol {
    func build(venue: Venue) -> UIView? {
        
        let builders:[DetailVenueBuilderProtocol] = [DetailVenueLikesBuilder(),DetailVenueRatingBuilder()]
        
        let views:[UIView] = builders.compactMap { (builder) -> UIView? in
            return builder.build(venue: venue)
        }

        if views.count == 0 {
            return nil
        }
        
        let detailView:DetailVenueRanking = DetailVenueRanking.loadNib()
        detailView.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        views.forEach { (view) in
            detailView.stackView?.addArrangedSubview(view)
        }
        
        return detailView
        
    }
}

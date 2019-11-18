//
//  InMapDetailPresenter.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

protocol InMapDetailPresenterDelegate {
    func navigateToVenueDetail(forVenue venue:Venue) -> Void
}

class InMapDetailPresenter {
    
    weak var parentView:UIView?
    weak var detailView:InMapDetail?
    
    var currentVenue:Venue?
    
    var delegate:InMapDetailPresenterDelegate?

    func setUp(parentView parent:UIView, delegate:InMapDetailPresenterDelegate) -> Void {
        self.parentView = parent
        self.delegate = delegate
        
        detailView = InMapDetail.loadNib()
        
        if let detailView = detailView{
            detailView.delegate = self
            parent.addSubview(detailView)
            detailView.autoPinEdge(toSuperviewEdge: .bottom)
            detailView.autoPinEdge(toSuperviewEdge: .trailing)
            detailView.autoPinEdge(toSuperviewEdge: .leading)
            
            //Hide view
            detailView.center.y += detailView.bounds.height
            detailView.isHidden = true
        }
    }
    
    func showDetail(withVenue venue:Venue) -> Void {
        if let detailView = detailView {
            if detailView.isHidden{
                detailView.showWithAnimation()
            }
            detailView.update(withVenue: venue)
            currentVenue = venue
        }
    }
    
    func hideDetail() -> Void {
        detailView?.hideWithAnimation()
    }
}

extension InMapDetailPresenter : InMapDetailDelegate{
    func moreInfoTapped() {
        delegate?.navigateToVenueDetail(forVenue: currentVenue!)
    }
}

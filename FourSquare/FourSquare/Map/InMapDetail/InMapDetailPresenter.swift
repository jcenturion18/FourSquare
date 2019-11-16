//
//  InMapDetailPresenter.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class InMapDetailPresenter {
    
    weak var parentView:UIView?
    weak var detailView:InMapDetail?

    func setUp(parentView parent:UIView) -> Void {
        self.parentView = parent
        
        detailView = Bundle.main.loadNibNamed( String(describing: InMapDetail.self), owner: nil, options: nil)?.first as? InMapDetail
        
        if let detailView = detailView{
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
        }
    }
    
    func hideDetail() -> Void {
        detailView?.hideWithAnimation()
    }
}

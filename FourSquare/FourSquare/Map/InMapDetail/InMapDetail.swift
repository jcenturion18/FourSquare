//
//  InMapDetail.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

protocol InMapDetailDelegate {
    func moreInfoTapped() -> Void
}

class InMapDetail: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var additionalInfoLabel: UILabel!
    
    var delegate:InMapDetailDelegate?
        
    func update(withVenue venue:Venue) -> Void {
        titleLabel.text = venue.name
        additionalInfoLabel.text = venue.location.formattedAddress?.joined(separator: "\n")
    }
    @IBAction func moreInfoTap(_ sender: Any) {
        delegate?.moreInfoTapped()
    }
}

//
//  InMapDetail.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class InMapDetail: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var additionalInfoLabel: UILabel!
    
    @IBOutlet weak var moreInfoTap: UITapGestureRecognizer!
    
    func update(withVenue venue:Venue) -> Void {
        titleLabel.text = venue.name
        additionalInfoLabel.text = venue.location.formattedAddress?.joined(separator: "\n")
    }
}

//
//  DetailVenueTitle.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueTitle: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    func setTitle(_ title:String) -> Void {
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
}

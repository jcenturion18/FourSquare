//
//  DetailVenueDescription.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueDescription: UIView {

    @IBOutlet private weak var descriptionLabel: UILabel!
    func setDescription(_ description:String) -> Void {
        descriptionLabel.text = description
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }

}

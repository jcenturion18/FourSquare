//
//  DetailVenueRating.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueRating: UIView {

    @IBOutlet weak var ratingLabel: UILabel!
    func setRating(_ raiting:String) -> Void {
        ratingLabel.text = "Score: \(raiting)"
    }
    func setFontColor(_ color:UIColor) -> Void{
        ratingLabel.textColor = color
    }
}


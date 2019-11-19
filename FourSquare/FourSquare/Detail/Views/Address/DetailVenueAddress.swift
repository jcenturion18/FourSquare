//
//  DetailVenueAddress.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/19/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueAddress: UIView {

    @IBOutlet weak var addressLabel: UILabel!

    func setAddress(_ address:String) -> Void {
        addressLabel.text = address
    }
}

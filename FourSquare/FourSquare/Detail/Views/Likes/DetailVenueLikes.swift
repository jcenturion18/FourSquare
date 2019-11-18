//
//  DetailVenueLikes.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueLikes: UIView {

    @IBOutlet weak var likesCountLabel: UILabel!
    func setLikes(_ likes:String) -> Void {
        likesCountLabel.text = likes
        likesCountLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
}

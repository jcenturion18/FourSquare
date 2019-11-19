//
//  DetailVenueRanking.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class DetailVenueRanking: UIView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}

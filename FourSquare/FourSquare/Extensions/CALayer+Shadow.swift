//
//  CALayer+Shadow.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

extension CALayer {
    
    func applyShadow() {
        masksToBounds = false
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 30/255
        shadowOffset = CGSize(width: 0, height: 1)
        shadowRadius = 1
    }
}

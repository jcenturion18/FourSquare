//
//  ShowMoreButtonStateHide.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class ShowMoreButtonStateHide: ShowMoreButtonStateProtocol {
    func apply(_ view: UIView) -> ShowMoreButtonStateProtocol {
        UIView.animate(withDuration: 0.5) {
            view.alpha = 0
        }
        return ShowMoreButtonStateShow()
    }
}

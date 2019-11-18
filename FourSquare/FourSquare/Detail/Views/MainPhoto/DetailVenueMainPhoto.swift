//
//  MainPhoto.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/18/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import Nuke

class DetailVenueMainPhoto: UIView {

    @IBOutlet weak var imageViewContainer: UIImageView!

    func url(_ url:String) -> Void {
        
        let url:URL = URL(string: url)!
        
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "VenuePlaceHolder"),
            failureImage: UIImage(named: "VenuePlaceHolder"),
            contentModes: .init(success: .scaleAspectFill, failure: .scaleAspectFill, placeholder: .scaleAspectFill)
        )
        Nuke.loadImage(with: url, options: options, into: imageViewContainer)
    }
}

//
//  VenueDetailSocialButton.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/19/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit

class VenueDetailSocialButton: UIView {

    private var urlString:String?
    @IBOutlet weak var imageView: UIImageView!

    func setImage(_ image:UIImage) -> Void {
        imageView.image = image
    }
    
    func setLink(_ url:String){
        urlString = url
    }
    
    @IBAction func tapOnView(_ sender: Any) {
        if let url = URL(string: urlString!) {
            UIApplication.shared.open(url)
        }
    }
    
}

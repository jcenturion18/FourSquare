//
//  CLLocationCoordinate2D+Location.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension CLLocationCoordinate2D{
    init(with location:Location) {
        self.init(latitude: location.lat, longitude: location.lng)
    }
}

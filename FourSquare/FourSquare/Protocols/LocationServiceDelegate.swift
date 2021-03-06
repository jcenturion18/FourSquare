//
//  LocationServiceDelegate.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/16/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

import UIKit
import MapKit

protocol LocationServiceDelegate {
    func updatedUserLocation(_ location:CLLocation)
}

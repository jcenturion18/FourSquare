//
//  Location.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/15/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

struct Location: Codable {
    let lat:Double
    let lng:Double
    let address: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]?
}

//
//  Venue.swift
//  FourSquare
//
//  Created by Julian Centurion on 11/15/19.
//  Copyright © 2019 Julian Centurion. All rights reserved.
//

struct Venue: Codable {
    let id: String
    let name: String
    let location: Location
    let contact: Contact?
    let rating: Double?
    let ratingColor: String?
    let ratingSignals: Double?
    let description: String?
}

struct Contact: Codable {
    let phone: String?
    let formattedPhone: String?
    let twitter: String?
    let instagram: String?
}

//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 29.01.2024.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

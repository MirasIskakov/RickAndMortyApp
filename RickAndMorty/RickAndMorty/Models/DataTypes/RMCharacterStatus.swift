//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 30.01.2024.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    // The status of the character ('Alive', 'Dead' or 'unknown').
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}

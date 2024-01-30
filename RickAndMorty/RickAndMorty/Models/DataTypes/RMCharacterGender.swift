//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 30.01.2024.
//

import Foundation

enum RMCharacterGender: String, Codable {
    // The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}

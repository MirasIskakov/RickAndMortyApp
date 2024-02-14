//
//  RMCharacretDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 14.02.2024.
//

import UIKit

final class RMCharacretDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}

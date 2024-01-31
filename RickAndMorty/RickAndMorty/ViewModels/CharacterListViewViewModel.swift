//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 31.01.2024.
//

import Foundation

struct CharacterListViewViewModel {
    func fatchCharacters() {
        RMService.shared.execute(.listCharecterRequest,
                                 expecting: String.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

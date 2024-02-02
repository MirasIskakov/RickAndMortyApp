//
//  CharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 02.02.2024.
//

import UIKit

final class CharacterCollectionViewCellViewModel {
    
    public let characretName: String
    private let characretStatus: RMCharacterStatus
    private let characretImageUrl: URL?
    
    init(
        characretName: String,
        characretStatus: RMCharacterStatus,
        characretImageUrl: URL?
    ) {
        self.characretName = characretName
        self.characretStatus = characretStatus
        self.characretImageUrl = characretImageUrl
    }
    
    public var caracterStatusTaxt: String {
        return characretStatus.rawValue
    }
    
    public func fetchImage(complition: @escaping (Result<Data, Error> ) -> Void) {
        
//        TODO: Abstract to Image Manager
        guard let url = characretImageUrl else {
            complition(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            complition(.success(data))
        }
        task.resume()
    }
    
}

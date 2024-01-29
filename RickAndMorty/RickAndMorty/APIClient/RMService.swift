//
//  RMService.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 29.01.2024.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
    
}

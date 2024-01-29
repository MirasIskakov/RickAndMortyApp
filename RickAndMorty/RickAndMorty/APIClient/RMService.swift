//
//  RMService.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 29.01.2024.
//

import Foundation

// Primory API service object to get Rick and Morty data
final class RMService {
//     Shared singleton instense
    static let shared = RMService()
    
//    privatizad constructor
    private init() {}
    
//    Send RM API Call => Parametrs:
//    - request: Request instence
//    - completion: Callback with data or error 
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
    
}

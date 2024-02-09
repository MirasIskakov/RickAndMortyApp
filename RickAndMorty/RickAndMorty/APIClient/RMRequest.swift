//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Miras Iskakov on 29.01.2024.
//

import Foundation

// Object that represents a single API call
final class RMRequest {
    //    Base URL
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    //   Desired endpoint
    private let endPoint: RMEndpoint
    
    //    Path components for API, if any
    private let pathComponents: [String]
    
    //    Query parameters for API, if any
    private let queryParameters: [URLQueryItem]
    
///    Constructed url for the api request in string formst
    public var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
            
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
           string += argumentString
        }
        return string
    }
    
//    Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
//    Desiered http method
    public let httpMethod = "GET"
    
    
// MARK: - Public
    
///    Construct request
///    - Parameters:
///      - endPoint: Target endpoint
///      - pathComponents: Collerction of Path Components
///      - queryParameters: Collection of Query Parameters
    public init(endPoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharecterRequest = RMRequest(endPoint: .character)
}

//
//  Endpoint.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation

enum Endpoint {
    static let baseURL: String = "https://rickandmortyapi.com/api"
    
    case character
    case location
    case episode
    
    
    func getURL(urlPaths: [String]?, queryItems: [String: String]?) -> URL? {
        guard var urlComponents: URLComponents = URLComponents(string: Self.baseURL) else { return nil }
        
        urlPaths?.forEach { urlComponents.path.append($0) }
        queryItems?.forEach { urlComponents.queryItems?.append(URLQueryItem(name: $0.key, value: $0.value)) }
        
        return urlComponents.url
    }
}

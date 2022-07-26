//
//  Endpoint.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation

enum Endpoint: String {
    static let baseURL: String = "https://rickandmortyapi.com/api/"
    
    case character
    case location
    case episode
    
    
    func getURL(urlPaths: [String]?, queryItems: [String: String]?) -> URL? {
        guard var urlComponents: URLComponents = URLComponents(string: Self.baseURL) else { return nil }
        
        urlComponents.path.append(self.rawValue)
        urlPaths?.forEach { urlComponents.path.append("/\($0)") }
        urlComponents.queryItems = queryItems?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        return urlComponents.url
    }
    
    static func getEpisodes(character: Character) -> String {
      
        return character.episode.map {
             $0.replacingOccurrences(of: "https://rickandmortyapi.com/api/episode/", with: "")
        } .joined(separator: ",") + ","
        
        
    }
    
    static func getCharacters(episode: Episode) -> String {
      
        return episode.characters.map {
             $0.replacingOccurrences(of: "https://rickandmortyapi.com/api/character/", with: "")
        } .joined(separator: ",") + ","
        
        
    }
}

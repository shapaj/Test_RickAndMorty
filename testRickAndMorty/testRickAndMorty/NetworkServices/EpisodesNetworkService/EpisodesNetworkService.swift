//
//  EpisodesNetworkService.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

protocol EpisodesNetworkServiceProtocol {
    func getEpisodes(character: Character, completionHandler: @escaping (Result<[Episode], Error>) -> ())
}

struct EpisodesNetworkService: EpisodesNetworkServiceProtocol {
    
    func getEpisodes(character: Character, completionHandler: @escaping (Result<[Episode], Error>) -> ()) {
        
        NetworkManager.shared.getModel(url: Endpoint.episode.getURL(urlPaths: [Endpoint.getEpisodes(character: character)], queryItems: nil),
                                       headers: nil,
                                       parametres: nil,
                                       completionHandler: completionHandler)
    }

    
    
    
    
}

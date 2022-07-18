//
//  EpisodesNetworkService.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

protocol EpisodesNetworkServiceProtocol {
    func fetchEpisodes(queryItems: [String: String]?, complition: @escaping (Result<CharactersModel, Error>) -> ())
    
    
    func getEpisodes(character: Character, completionHandler: @escaping (Result<[Episode], Error>) -> ())
    
    func nextEpisodes(page: String?, complition: @escaping (Result<CharactersModel, Error>) -> ())
    
    
}

struct EpisodesNetworkService: EpisodesNetworkServiceProtocol {
    
    func fetchEpisodes(queryItems: [String : String]?, complition: @escaping (Result<CharactersModel, Error>) -> ()) {
        
    }
    
    func nextEpisodes(page: String?, complition: @escaping (Result<CharactersModel, Error>) -> ()) {
        
    }
    
   
    
    func getEpisodes(character: Character, completionHandler: @escaping (Result<[Episode], Error>) -> ()) {
        
        NetworkManager.shared.getModel(url: Endpoint.episode.getURL(urlPaths: [Endpoint.getEpisodes(character: character)], queryItems: nil),
                                       headers: nil,
                                       parametres: nil,
                                       completionHandler: completionHandler)
    }
}

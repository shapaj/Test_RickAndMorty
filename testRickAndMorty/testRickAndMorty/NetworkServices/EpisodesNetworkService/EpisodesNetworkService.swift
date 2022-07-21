//
//  EpisodesNetworkService.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

protocol EpisodesNetworkServiceProtocol {
    /// First page Episodes
    /// queryItems using for search exemple ["name" : Rick]
    func fetchEpisodes(queryItems: [String: String]?, complition: @escaping (Result<EpisodesModel, Error>) -> ())
    
    /// First page characters by episodes
    func getEpisodes(character: Character, completionHandler: @escaping (Result<[Episode], Error>) -> ())
    
    /// Next page episodes by last feched model url
    func nextEpisodes(page: String?, complition: @escaping (Result<EpisodesModel, Error>) -> ())
}

struct EpisodesNetworkService: EpisodesNetworkServiceProtocol {
    
    func fetchEpisodes(queryItems: [String : String]?, complition: @escaping (Result<EpisodesModel, Error>) -> ()) {
        
        guard let url = Endpoint.episode.getURL(urlPaths: nil, queryItems: queryItems) else { return }

        NetworkManager.shared.getModel(url: url, headers: nil, parametres: nil, completionHandler: complition)
    }
    
    func nextEpisodes(page: String?, complition: @escaping (Result<EpisodesModel, Error>) -> ()) {
        guard let page = page,
              let url = URL(string: page) else { return }
        NetworkManager.shared.getModel(url: url, headers: nil, parametres: nil, completionHandler: complition)
    }
    
   
    
    func getEpisodes(character: Character, completionHandler: @escaping (Result<[Episode], Error>) -> ()) {
        
        NetworkManager.shared.getModel(url: Endpoint.episode.getURL(urlPaths: [Endpoint.getEpisodes(character: character)], queryItems: nil),
                                       headers: nil,
                                       parametres: nil,
                                       completionHandler: completionHandler)
    }
}

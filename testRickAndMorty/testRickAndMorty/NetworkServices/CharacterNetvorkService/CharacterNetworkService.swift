//
//  CharacterNetworkService.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation

protocol CharacterNetworkServiceProtocol {
    /// First page characters
    /// queryItems using for search exemple ["name" : Rick]
    func fetchCharacters(queryItems: [String: String]?, complition: @escaping (Result<CharactersModel, Error>) -> ())
    
    /// First page characters by episode
    func getCharacters(episode: Episode, completionHandler: @escaping (Result<[Character], Error>) -> ())
    
    /// Next page characters by last feched model url
    func nextCharacters(page: String?, complition: @escaping (Result<CharactersModel, Error>) -> ())
    
    /// Any Image by URL
    func getCharacterImage(by url: URL, complitionHandler: @escaping (Data) -> Void)
}

struct CharacterNetworkService: CharacterNetworkServiceProtocol {

    func fetchCharacters(queryItems: [String: String]? = nil, complition: @escaping (Result<CharactersModel, Error>) -> ()) {
        
    
        guard let url = Endpoint.character.getURL(urlPaths: nil, queryItems: queryItems) else { return }
        
        NetworkManager.shared.getModel(url: url, headers: nil, parametres: nil, completionHandler: complition)
    }
    
    func getCharacters(episode: Episode, completionHandler: @escaping (Result<[Character], Error>) -> ()) {
        
    }
    
    func nextCharacters(page: String?, complition: @escaping (Result<CharactersModel, Error>) -> ()) {
        
        guard let page = page,
            let url = URL(string: page) else { return }
        
        NetworkManager.shared.getModel(url: url, headers: nil, parametres: nil, completionHandler: complition)
    }
    
    func getCharacterImage(by url: URL, complitionHandler: @escaping (Data) -> Void) {
        NetworkManager.shared.getImage(by: url, complitionHandler: complitionHandler)
    }
}


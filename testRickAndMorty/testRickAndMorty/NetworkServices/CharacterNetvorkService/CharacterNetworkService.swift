//
//  CharacterNetworkService.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation

protocol CharacterNetworkServiceProtocol {
    func getCharacters(queryItems: [String: String]?, complition: @escaping (Result<CharactersModel, Error>) -> ())
    func nextCharacters(page: String?, complition: @escaping (Result<CharactersModel, Error>) -> ())
    func getCharacterImage(by url: URL, complitionHandler: @escaping (Data) -> Void)
}

struct CharacterNetworkService: CharacterNetworkServiceProtocol {

    func getCharacters(queryItems: [String: String]? = nil, complition: @escaping (Result<CharactersModel, Error>) -> ()) {
        
    
        guard let url = Endpoint.character.getURL(urlPaths: nil, queryItems: queryItems) else { return }
        
        NetworkManager.shared.getModel(url: url, headers: nil, parametres: nil, completionHandler: complition)
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


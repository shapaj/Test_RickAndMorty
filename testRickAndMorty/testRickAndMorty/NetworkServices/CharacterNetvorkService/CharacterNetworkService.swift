//
//  CharacterNetworkService.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation

protocol CharacterNetworkServiceProtocol {
    func getCharacters(page: String?, complition: @escaping (Result<CharactersModel, Error>) -> ())
}

struct CharacterNetworkService: CharacterNetworkServiceProtocol {

    func getCharacters(page: String? = nil, complition: @escaping (Result<CharactersModel, Error>) -> ()) {
        
        guard let url = URL(string: page ?? "") ?? Endpoint.character.getURL(urlPaths: nil, queryItems: nil) else { return }
        
        NetworkManager.shared.getModel(url: url, headers: nil, parametres: nil, completionHandler: complition)
    }
}

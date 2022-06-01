//
//  AllCharactersPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

final class AllCharactersPresenter: AllCharactersPresenterProtocol {
    private weak var view: AllCharactersViewProtocol!
    private var networkService: CharacterNetworkServiceProtocol
    
    init(view: AllCharactersViewProtocol!, networkService: CharacterNetworkService) {
        self.view = view
        self.networkService = networkService
    }
}

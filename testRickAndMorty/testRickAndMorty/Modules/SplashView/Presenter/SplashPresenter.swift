//
//  SplashPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

final class SplashPresenter: SplashPresenterProtocol {
    private weak var view: SplashViewProtocol!
    private let networkService: CharacterNetworkServiceProtocol
    
    init(view: SplashViewProtocol, networkService: CharacterNetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
    
    // MARK: SplashPresenterProtocol
    
    func getCharacters() {
        
        networkService.fetchCharacters(queryItems: nil) { [weak self] result in
            
            defer {
                OperationQueue.main.addOperation { self?.view.hidePortal() }
            }
            
            switch result {
            case .failure(let error): 
                print(error.localizedDescription)
                self?.view.presentHomeSctreen(charactersModel: nil)
            case .success(let charactersModel):
                sleep(1)
                self?.view.presentHomeSctreen(charactersModel: charactersModel)
            }
        }
    }
    
    func presentHomeSctreen() {
        view.showPortal()
    }
}

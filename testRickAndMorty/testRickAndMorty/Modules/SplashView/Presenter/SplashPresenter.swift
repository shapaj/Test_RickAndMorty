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
    func presentHomeSctreen() {
        
        view.showPortal()
        
//        view.presentHomeSctreen()
    }
}

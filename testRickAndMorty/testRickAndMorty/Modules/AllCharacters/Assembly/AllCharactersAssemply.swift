//
//  AllCharactersAssemply.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit

struct AllCharactersAssembly {
    
    static func createModule() -> AllCharactersViewController {
        let viewController = AllCharactersViewController()
        
        
        
        return viewController
    }
    
}

final class AllCharactersViewController: UIViewController, AllCharactersViewProtocol {
    var presenter: AllCharactersPresenterProtocol!
    
}

protocol AllCharactersViewProtocol: UIViewController, AllCharactersRouter {
    
}

protocol AllCharactersRouter {
    
}

final class AllCharactersPresenter: AllCharactersPresenterProtocol {
    private weak var view: AllCharactersViewProtocol!
    private var networkService: CharacterNetworkService
    
    init(view: AllCharactersViewProtocol!, networkService: CharacterNetworkService) {
        self.view = view
        self.networkService = networkService
    }
}

protocol AllCharactersPresenterProtocol {
    
}

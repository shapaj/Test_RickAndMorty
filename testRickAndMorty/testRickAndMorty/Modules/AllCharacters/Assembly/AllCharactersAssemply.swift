//
//  AllCharactersAssemply.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit

struct AllCharactersAssembly {
    
    static func createModule(charactersModel: CharactersModel? = nil) -> AllCharactersViewController {
        let viewController = AllCharactersViewController()
        viewController.presenter = AllCharactersPresenter(view: viewController,
                                                          model: charactersModel,
                                                          networkService: CharacterNetworkService())
        
        
        return viewController
    }
    
    static func tabBarViewController(charactersModel: CharactersModel? = nil) -> UIViewController {
        
        let tabbarItem = UITabBarItem(title: InterfaceStrings.characters.rawValue,
                                      image: Images.charactersIcon,
                                      selectedImage: Images.charactersIcon)
        
        let navigationController = UINavigationController(rootViewController: createModule(charactersModel: charactersModel))
        navigationController.isNavigationBarHidden = true
        navigationController.tabBarItem = tabbarItem
        
        return navigationController
    }
}

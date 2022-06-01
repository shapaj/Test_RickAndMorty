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
        viewController.presenter = AllCharactersPresenter(view: viewController,
                                                          networkService: CharacterNetworkService())
        
        
        return viewController
    }
    
    static func tabBarViewController() -> UIViewController {
        
        let tabbarItem = UITabBarItem(title: InterfaceStrings.characters.rawValue,
                                      image: Images.charactersIcon,
                                      selectedImage: Images.charactersIcon)
        
        let navigationController = UINavigationController(rootViewController: createModule())
        navigationController.isNavigationBarHidden = true
        navigationController.tabBarItem = tabbarItem
        
        return navigationController
    }
}

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
    
    static func createModule1(charactersModel: CharactersModel? = nil) -> AllCharactersViewController1 {
        let viewController = AllCharactersViewController1()
        viewController.presenter = AllCharactersPresenter(view: viewController,
                                                          model: charactersModel,
                                                          networkService: CharacterNetworkService())
        
        
        return viewController
    }
    
    static func createModule2(charactersModel: CharactersModel? = nil) -> AllCharactersViewController2 {
        let viewController = AllCharactersViewController2()
        viewController.presenter = AllCharactersPresenter(view: viewController,
                                                          model: charactersModel,
                                                          networkService: CharacterNetworkService())
        
        
        return viewController
    }
    
    static func createModule3(charactersModel: CharactersModel? = nil) -> AllCharactersViewController3 {
        let viewController = AllCharactersViewController3()
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

    static func tabBarViewController1(charactersModel: CharactersModel? = nil) -> UIViewController {
        
        let tabbarItem = UITabBarItem(title: InterfaceStrings.characters.rawValue,
                                      image: Images.charactersIcon,
                                      selectedImage: Images.charactersIcon)
        
        let navigationController = UINavigationController(rootViewController: createModule1(charactersModel: charactersModel))
        navigationController.isNavigationBarHidden = true
        navigationController.tabBarItem = tabbarItem
        
        return navigationController
    }

    static func tabBarViewController2(charactersModel: CharactersModel? = nil) -> UIViewController {
        
        let tabbarItem = UITabBarItem(title: InterfaceStrings.characters.rawValue,
                                      image: Images.charactersIcon,
                                      selectedImage: Images.charactersIcon)
        
        let navigationController = UINavigationController(rootViewController: createModule2(charactersModel: charactersModel))
        navigationController.isNavigationBarHidden = true
        navigationController.tabBarItem = tabbarItem
        
        return navigationController
    }

    static func tabBarViewController3(charactersModel: CharactersModel? = nil) -> UIViewController {
        
        let tabbarItem = UITabBarItem(title: InterfaceStrings.characters.rawValue,
                                      image: Images.charactersIcon,
                                      selectedImage: Images.charactersIcon)
        
        let viewController = createModule3(charactersModel: charactersModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        navigationController.tabBarItem = tabbarItem
        navigationController.transitioningDelegate = viewController
        return navigationController
    }
}

//
//  EpisodesAssembly.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

struct EpisodesAssembly {
    
    static func createModule() -> EpisodesViewController {
        
        let viewController = EpisodesViewController()
        viewController.presenter = EpisodesPresenter(view: viewController, networkService: EpisodesNetworkService())
        
        return viewController
    }
    
    static func tabBarViewController() -> UIViewController {
        let tabbarItem = UITabBarItem(title: InterfaceStrings.epsodes.rawValue,
                                      image: Images.epsodesIcon,
                                      selectedImage: Images.epsodesIcon)
        
        let navigationController = UINavigationController(rootViewController: createModule())
        navigationController.isNavigationBarHidden = true
        navigationController.tabBarItem = tabbarItem
        
        return navigationController
    }
}

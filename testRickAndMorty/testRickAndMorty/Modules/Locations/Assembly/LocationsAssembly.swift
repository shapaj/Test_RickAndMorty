//
//  LocationsAssembly.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit
import SwiftUI

struct LocationsAssembly {
    
    static func createModule() -> LocationsViewContrioller {
        let viewController = LocationsViewContrioller()
        viewController.presenter = LocationsPresenter(view: viewController,
                                                      networkService: LocationNetworkService())
        
        return viewController
    }
    
    static func tabBarViewController() -> UIViewController {
        let tabbarItem = UITabBarItem(title: InterfaceStrings.locations.rawValue,
                                      image: Images.locationsIcon,
                                      selectedImage: Images.epsodesIcon)
        
        let navigationController = UINavigationController(rootViewController: createModule())
        navigationController.isNavigationBarHidden = true
        navigationController.tabBarItem = tabbarItem
        
        return navigationController
    }
}

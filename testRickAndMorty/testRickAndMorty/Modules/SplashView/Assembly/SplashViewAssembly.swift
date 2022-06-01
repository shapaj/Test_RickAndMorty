//
//  SplashViewAssembly.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

struct SplashViewAssembly {
    
    static func createModule() -> SplashViewController {
     
        let viewController = SplashViewController()
        
        viewController.presenter = SplashPresenter(view: viewController, networkService: CharacterNetworkService())
        
        return viewController
    }
}

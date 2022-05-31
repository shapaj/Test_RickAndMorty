//
//  CharacterAssembly.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

struct CharacterAssembly {
    
    static func createModule() -> CharacterViewController {
        
        let viewController = CharacterViewController()
        
        viewController.presenter = CharacterPresenter(view: viewController)
        
        return viewController
    }
}

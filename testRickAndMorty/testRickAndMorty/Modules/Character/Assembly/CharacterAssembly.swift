//
//  CharacterAssembly.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

struct CharacterAssembly {
    
    static func createModule(character: Character) -> CharacterViewController {
        
        let viewController = CharacterViewController()
        
        viewController.presenter = CharacterPresenter(view: viewController, character: character, episodesNetworkService: EpisodesNetworkService(), characterNetworkService: CharacterNetworkService())
        
        return viewController
    }
}

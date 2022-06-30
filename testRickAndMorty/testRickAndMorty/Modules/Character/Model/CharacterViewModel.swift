//
//  CharacterViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

struct CharacterViewModel {
 
    let navigationBarModel: CommonNavigationBarModel
    var sections: [CharacterDetalInfoSectionViewModel] = []
    let id: Int
    let imageURL: URL?
 
    init(character: Character) {
        
        id = character.id
        navigationBarModel = CommonNavigationBarModel(title: character.name)
        
        sections = [
            CharacterDetalInfoSectionViewModel(.status, [character.status.rawValue]),
            CharacterDetalInfoSectionViewModel(.species, [character.species]),
            CharacterDetalInfoSectionViewModel(.gender, [character.gender.rawValue]),
            CharacterDetalInfoSectionViewModel(.origin, [character.origin.name]),
            CharacterDetalInfoSectionViewModel(.location, [character.location.name]),
            CharacterDetalInfoSectionViewModel(.episodes, [])
        ]
        
        if character.type != "" {
            sections.insert(CharacterDetalInfoSectionViewModel(.type, [character.type]), at: 3)
        }
        
        imageURL = URL(string: character.image)
    }
}

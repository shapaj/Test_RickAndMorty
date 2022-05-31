//
//  AllCharactersViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

struct AllCharactersViewModel {
    var characterCells: [CharacterCellViewModel]
    
    
    init(charactersModel: CharactersModel) {
        characterCells = []
    }
}

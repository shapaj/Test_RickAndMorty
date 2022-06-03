//
//  AllCharactersViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

struct AllCharactersViewModel {
    var characterCells: [CharacterCellViewModel]
    
    init(charactersModel: CharactersModel) {
        
        characterCells = charactersModel.results.map {  CharacterCellViewModel(model: $0) }
    }
}

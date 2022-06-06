//
//  CharacterViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

struct CharacterViewModel {
 
    let id: Int
    var imageURL: URL?
    let name: String
    let progressValue: Float
    let progressTintColor: UIColor?
 
    init(character: Character) {
        id = character.id
        name = character.name
        imageURL = URL(string: character.image)
        progressValue = character.status.progressValue
        progressTintColor = character.status.progressTintColor
    }
}

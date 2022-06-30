//
//  CharacterCellViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

struct CharacterCellViewModel {
 
    let id: Int
    var imageURL: URL?
    let name: String
    let episodes: String
    let progressValue: Float
    let progressTintColor: UIColor?
 
    init(model: Character) {
        id = model.id
        name = model.name
        episodes = "\(model.episode.count) episodes"
        imageURL = URL(string: model.image)
        progressValue = model.status.progressValue
        progressTintColor = model.status.progressTintColor
    }
}

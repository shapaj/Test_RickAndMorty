//
//  CharacterCellViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

struct CharacterCellViewModel {
 
    var imageURL: URL?
    let name: String
//    let status: String
    let episodes: String
    let progressValue: Float
 
    init(model: Character) {
        name = model.name
//        status = model.status
        episodes = "\(model.episode.count) episodes"
        imageURL = URL(string: model.image)
        progressValue = model.status.progressValue
    }
}

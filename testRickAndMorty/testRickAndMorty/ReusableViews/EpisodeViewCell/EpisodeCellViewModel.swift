//
//  EpisodeCellViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 19.07.2022.
//

import Foundation

struct EpisodeCellViewModel {
    
    let name: String
    let air_date: String
    let episode: String
    
    init(model: Episode) {
        name = model.name
        air_date = model.air_date
        episode = model.episode
    }
}

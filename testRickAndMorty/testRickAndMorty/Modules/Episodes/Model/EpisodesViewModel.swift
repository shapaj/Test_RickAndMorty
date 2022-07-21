//
//  EpisodesViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation


struct AllCharactersViewModel1 {
    var characterCells: [CharacterCellViewModel]
    let charactersCount: Int
    init(charactersModel: CharactersModel) {
        charactersCount = charactersModel.info.count
        characterCells = charactersModel.results.map {  CharacterCellViewModel(model: $0) }
    }
}

struct EpisodesViewModel {
    var episodeCells: [EpisodeCellViewModel]
    let episodesCount: Int
    init(episodesModel: EpisodesModel) {
        episodesCount = episodesModel.info.count
        episodeCells = episodesModel.results.map {
            EpisodeCellViewModel(model: $0)
            //CharacterCellViewModel(model: $0)
            
        }
    }
}

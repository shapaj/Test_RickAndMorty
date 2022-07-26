//
//  EpisodesViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation


struct EpisodesViewModel {
    var episodeCells: [EpisodeCellViewModel]
    let episodesCount: Int
    init(episodesModel: EpisodesModel) {
        episodesCount = episodesModel.info.count
        episodeCells = episodesModel.results.map { EpisodeCellViewModel(model: $0) }
    }
}

//
//  EpisodesPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

final class EpisodesPresenter: EpisodesPresenterProtocol {
    
    private var episodesModel: EpisodesModel?
    private weak var view: EpisodesViewProtocol!
    private let networkService: EpisodesNetworkServiceProtocol
    
    init(view: EpisodesViewProtocol, networkService: EpisodesNetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
}

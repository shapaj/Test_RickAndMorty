//
//  EpisodesPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

final class EpisodesPresenter: EpisodesPresenterProtocol {
    
    private var model: EpisodesModel?
    private weak var view: EpisodesViewProtocol!
    private let networkService: EpisodesNetworkServiceProtocol
    
    init(view: EpisodesViewProtocol, model: EpisodesModel? = nil, networkService: EpisodesNetworkServiceProtocol) {
        self.view = view
        self.model = model
        self.networkService = networkService
    }
    
    func viewDidLoad() {
        networkService.fetchEpisodes(queryItems: nil) { [weak self] result in
            switch result {
            case .failure(let error):
                print("error", error.localizedDescription)
            case .success( let episodesModel):
                self?.model = episodesModel
            }
        }
    }
    
    private func updateView() {
        if let model = model {
            view?.updateInterface(viewModel: model)
        }
    }
    
    
    func goToTopTapped() {
        view?.scrollTableToTop()
    }
    
}



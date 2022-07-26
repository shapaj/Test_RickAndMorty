//
//  EpisodesPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import CoreAudio

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
        fetchEpisodes()
    }
    
    private func fetchEpisodes() {
        networkService.fetchEpisodes(queryItems: nil) { [weak self] result in
            switch result {
            case .failure(let error):
                print("error", error.localizedDescription)
            case .success( let episodesModel):
                self?.model = episodesModel
                self?.updateView()
            }
        }
    }
    
    private func updateView() {
        if let model = model {
            OperationQueue.main.addOperation { [weak view] in
                
                    view?.updateInterface(viewModel: EpisodesViewModel(episodesModel: model))
            }
        }
    }
    
    func goToTopTapped() {
        view?.scrollTableToTop()
    }
    
    func cellTaped(indexPath: IndexPath) {
        print(indexPath)
        
        guard let episode = model?.results[indexPath.row] else { return }
        networkService.getCharacters(episode: episode) { [weak self] result in
            switch result {
            case .success(let characters):
                OperationQueue.main.addOperation { [weak self] in
                    self?.view?.updateInterface(viewModel: indexPath)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        
    }
    
}



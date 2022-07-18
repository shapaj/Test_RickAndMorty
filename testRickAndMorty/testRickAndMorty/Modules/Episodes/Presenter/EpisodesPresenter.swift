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
        
    }
    
    func goToTopTapped() {
        view?.scrollTableToTop()
    }
    
}



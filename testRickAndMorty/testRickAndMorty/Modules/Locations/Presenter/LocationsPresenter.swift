//
//  LocationsPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

final class LocationsPresenter: LocationsPresenterProtocol {
    
    private weak var view: LocationsViewProtocol!
    private var networkService: LocationNetworkService
    
    init(view: LocationsViewProtocol, networkService: LocationNetworkService) {
        self.view = view
        self.networkService = networkService
    }
}

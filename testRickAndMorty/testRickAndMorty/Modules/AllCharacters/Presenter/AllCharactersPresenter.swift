//
//  AllCharactersPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

final class AllCharactersPresenter: AllCharactersPresenterProtocol {
    private weak var view: AllCharactersViewProtocol!
    private var networkService: CharacterNetworkServiceProtocol
    private var model: CharactersModel? = nil
    
    init(view: AllCharactersViewProtocol!, model: CharactersModel? = nil, networkService: CharacterNetworkService) {
        self.view = view
        self.model = model
        self.networkService = networkService
    }
    
    func viewDidLoad() {
        if let model = model {
            updateView(model: model)
        } else {
            getNextCharacters()
        }
    }
    
    func getNextCharacters() {
        networkService.getCharacters(page: model?.info.next) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newModel):
                self?.model = newModel
                self?.updateView(model: newModel)
            }
        }
    }
    
    private func updateView(model: CharactersModel) {
        OperationQueue.main.addOperation { [weak self] in
            self?.view.updateInterface(viewModel: AllCharactersViewModel(charactersModel: model).characterCells)
        }
    }
    
    
}

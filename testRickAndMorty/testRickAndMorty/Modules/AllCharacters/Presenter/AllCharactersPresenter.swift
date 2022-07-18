//
//  AllCharactersPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

final class AllCharactersPresenter: AllCharactersPresenterProtocol {
    
    private weak var view: AllCharactersViewProtocol!
    private var networkService: CharacterNetworkServiceProtocol
    private var model: CharactersModel?
    
    
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
    
    func tableViewdidSelectRowAt(_ indexPath: IndexPath) {
        guard let character = model?.results[indexPath.row] else { return }
        
        view.presentCharacterView(character: character)
    }
    
    func getCharacters(name: String?) {
        guard let name = name else { return }
        
        networkService.fetchCharacters(queryItems: ["name": name]) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                self.model = CharactersModel.nilObject()
            case .success(let newModel):
                self.model = newModel
            }

            guard let model = self.model else { return }
            self.updateView(model: model)
        }
    }
    
    func getNextCharacters() {
        networkService.nextCharacters(page: model?.info.next) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let newModel):
                self?.model?.ubdateModel(with: newModel)
                guard let self = self, let model = self.model else { return }
                self.updateView(model: model)
            }
        }
    }
    
    func getCharacterImage(by url: URL, complitionHandler: @escaping (UIImage) -> Void) {
        let queue = OperationQueue()
        queue.qualityOfService = .background
        queue.addOperation { [weak self] in
            
            self?.networkService.getCharacterImage(by: url) { result in
                guard let image = UIImage(data: result) else { return }
                complitionHandler(image)
            }
        }
    }
    
    private func updateView(model: CharactersModel) {
        OperationQueue.main.addOperation { [weak self] in
            self?.view.updateInterface(viewModel: AllCharactersViewModel(charactersModel: model))
        }
    }
    
    
    func tableWasScrolled() {
        OperationQueue.main.addOperation { [weak self] in
            self?.view.showGoToTop()
        }
    }
    
    func goToTopTapped() {
        OperationQueue.main.addOperation { [weak self] in
            self?.view.scrollTableToTop()
        }
    }
    
    
}

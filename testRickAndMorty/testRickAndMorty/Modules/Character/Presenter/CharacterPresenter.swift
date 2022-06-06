//
//  CharacterPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

final class CharacterPresenter: CharacterPresenterProtocol {
    
    private weak var view: CharacterViewProtocol!
    private let character: Character
    private let episodesNetworkService: EpisodesNetworkServiceProtocol
    private let characterNetworkService: CharacterNetworkServiceProtocol
    
    init(view: CharacterViewProtocol,
         character: Character,
         episodesNetworkService: EpisodesNetworkServiceProtocol,
         characterNetworkService: CharacterNetworkServiceProtocol) {
        self.view = view
        self.character = character
        self.characterNetworkService = characterNetworkService
        self.episodesNetworkService = episodesNetworkService
    }
    
    // MARK: CharacterPresenterProtocol
    func viewDidLoad() {
        
        self.updateInterface(viewModel: CharacterViewModel(character: character))
        
        episodesNetworkService.getEpisodes(character: character) { [weak self] result in
            switch result {
            case .success(let episodes):
                self?.updateInterface(viewModel: episodes)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        if let url = URL(string: character.image) {
            characterNetworkService.getCharacterImage(by: url) { [weak self] result in
                guard let image = UIImage(data: result) else { return }
                self?.updateInterface(viewModel: image)
            }
        }
        
        episodesNetworkService.getEpisodes(character: character) { [weak self] result in
            switch result {
                
            case .success(let episodes):
                self?.updateInterface(viewModel: episodes)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func navigationBarLeftButton()  {
        view.showPrevious()
    }
    
    private func updateInterface(viewModel: Any) {
        OperationQueue.main.addOperation { [weak view] in
            view?.updateInterface(viewModel: viewModel)
        }
    }
}

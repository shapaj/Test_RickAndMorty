//
//  CharacterPresenter.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

final class CharacterPresenter: CharacterPresenterProtocol {
    
    private weak var view: CharacterViewProtocol!
    
    private var model: CharacterViewModel?
    
    init(view: CharacterViewProtocol) {
        self.view = view
    }
}

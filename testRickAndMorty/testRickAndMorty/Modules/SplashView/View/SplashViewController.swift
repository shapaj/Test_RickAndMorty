//
//  SplashViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit
import SwiftUI

final class SplashViewController: BaseViewController, SplashViewProtocol {
    
    var presenter: SplashPresenterProtocol!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.background
        presenter.getCharacters()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.presentHomeSctreen()
    }
    
    // MARK: SplashRouterProtocol
    
    func presentHomeSctreen(charactersModel: CharactersModel? ) {
        
        
        
        let queue = OperationQueue.main
        queue.addOperation {
            NavigationManager.shared.presentTabViewController(charactersModel: charactersModel)
        }
        

    }
}

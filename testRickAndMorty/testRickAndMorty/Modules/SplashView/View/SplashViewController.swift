//
//  SplashViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit
import SwiftUI

final class SplashViewController: UIViewController, SplashViewProtocol {
    
    var presenter: SplashPresenterProtocol!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.background
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.presentHomeSctreen()
    }
    
    // MARK: SplashRouterProtocol
    
    func presentHomeSctreen() {
        
        
        
        let queue = OperationQueue.main
        queue.addOperation {

//        DispatchQueue.main.async {
        NavigationManager.shared.presentTabViewController()
        }
        

    }
}

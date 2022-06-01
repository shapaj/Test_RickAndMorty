//
//  AllCharactersViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import UIKit

final class AllCharactersViewController: UIViewController, AllCharactersViewProtocol {
    var presenter: AllCharactersPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
    }
}

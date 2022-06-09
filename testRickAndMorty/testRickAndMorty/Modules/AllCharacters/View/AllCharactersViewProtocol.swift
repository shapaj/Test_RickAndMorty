//
//  AllCharactersViewProtocol.swift.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit

protocol AllCharactersViewProtocol: UIViewController, AllCharactersRouterProtocol {
    func updateInterface(viewModel: AllCharactersViewModel)
}

//
//  ViewProtocols.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit

protocol CharacterViewProtocol: UIViewController, CharacterRouterProtocol {
    func updateInterface(viewModel: Any)
    
}

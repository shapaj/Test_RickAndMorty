//
//  EpisodesPresenterProtocol.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

protocol EpisodesPresenterProtocol: ScrollableToTop {
    func viewDidLoad()
    func cellTaped(indexPath: IndexPath)
}

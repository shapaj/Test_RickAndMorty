//
//  CharacterRouterProtocol.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

protocol CharacterRouterProtocol {
    func showPrevious()
    func pushEpisodeView(episode: Episode)
    func presentEpisodes(character: Character)
}

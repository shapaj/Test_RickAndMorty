//
//  AllCharactersPresenterProtocol.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit

protocol AllCharactersPresenterProtocol {
    func viewDidLoad()
    func getNextCharacters()
    func tableViewdidSelectRowAt(_ indexPath: IndexPath)
    func getCharacterImage(by url: URL, complitionHandler: @escaping (UIImage) -> Void)
    func tableWasScrolled()
    func goToTopTapped()
    func getCharacters(name: String?)
}

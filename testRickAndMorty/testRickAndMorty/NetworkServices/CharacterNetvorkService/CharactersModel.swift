//
//  CharacterModel.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation
import UIKit

struct CharactersModel: Codable {
    
    var info: ResponceModelInfo
    var results: [Character]
   
    mutating func ubdateModel(with newModel: CharactersModel) {
        results.append(contentsOf: newModel.results)
        info = newModel.info
    }
    
    private init() {
        info = ResponceModelInfo()
        results = []
    }
    
    static func nilObject() -> CharactersModel {
        return CharactersModel()
    }
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: CharacterStatus // make enum
    let species: String
    let type: String    // make enum
    let gender: CharactersGender // make enum
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    struct Location: Codable {
        let name: String
        let url: String
    }
    
    enum CharactersGender: String, Codable {
        case Female = "Female"
        case Male = "Male"
        case Genderless = "Genderless"
        case unknown = "unknown"
    }
    
    enum CharacterStatus: String, Codable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
        
        var progressValue: Float {
            switch self {
            case .alive:
                return Float(1)
            case .dead:
                return Float(0.05)
            case .unknown:
                return Float(0.5)
            }
        }
        
        var progressTintColor: UIColor? {
            switch self {
            case .alive:
                return Colors.darkGreen
            case .dead:
                return Colors.darkRed
            case .unknown:
                return Colors.darkOrange
            }
        }
    }
}


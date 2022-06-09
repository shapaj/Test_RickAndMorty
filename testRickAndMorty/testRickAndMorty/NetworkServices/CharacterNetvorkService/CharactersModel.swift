//
//  CharacterModel.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation
import UIKit

struct CharactersModel: Codable {
    
    var info: CharactersInfo
    var results: [Character]
    
    struct CharactersInfo: Codable {
        let count: Int
        let pages: Int
        var next: String?
        var prev: String?
        
        enum DecodingKeys: String, CodingKey {
            case count
            case pages
            case next
            case prev
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: DecodingKeys.self)
            count = (try? container.decode(Int.self, forKey: .count)) ?? 0
            pages = (try? container.decode(Int.self, forKey: .pages)) ?? 0
            next = try? container.decode(String.self, forKey: .next)
            prev = try? container.decode(String.self, forKey: .prev)
        }
    }
    
    mutating func ubdateModel(with newModel: CharactersModel) {
        results.append(contentsOf: newModel.results)
        info = newModel.info
        
        
        
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


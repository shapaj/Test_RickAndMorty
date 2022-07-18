//
//  EpisodesModel.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation

struct EpisodesModel: Codable {
    
    var info: ResponceModelInfo
    var results: [Episode]
    
    mutating func ubdateModel(with newModel: EpisodesModel) {
        results.append(contentsOf: newModel.results)
        info = newModel.info
    }
    
    private init() {
        info = ResponceModelInfo()
        results = []
    }
    
    static func nilObject() -> EpisodesModel {
        return EpisodesModel()
    }
}

struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String //"2017-11-10T12:56:33.798Z"
}

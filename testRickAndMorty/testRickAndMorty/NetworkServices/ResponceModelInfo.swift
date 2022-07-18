//
//  ResponceModelInfo.swift
//  testRickAndMorty
//
//  Created by anduser on 10.07.2022.
//

import Foundation

struct ResponceModelInfo: Codable {
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
    
    init() {
        count = 0
        pages = 0
    }
}

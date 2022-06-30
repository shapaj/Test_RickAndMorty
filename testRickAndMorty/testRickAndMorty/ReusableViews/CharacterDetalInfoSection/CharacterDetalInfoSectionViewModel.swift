//
//  CharacterDetalInfoSectionViewModel.swift
//  testRickAndMorty
//
//  Created by anduser on 06.06.2022.
//

import UIKit

struct CharacterDetalInfoSectionViewModel {
    let type: UserInfoSectionTipys
    var cells: [CharacterDetalInfoCellViewModel] = []
    
    init(_ type: UserInfoSectionTipys, _ values: [String]) {
        self.type = type
        
        cells = values.compactMap { CharacterDetalInfoCellViewModel(title: $0) }
    }
}

enum UserInfoSectionTipys: String {
    
    case status = "Status"
    case species = "Species"
    case type = "Type"
    case gender = "Gender"
    case origin = "Origin"
    case location = "Location"
    case episodes = "Episodes"
    
    func getIcon() -> UIImage? {
        switch self {
        case .status: return Images.heard
        case .species: return Images.alien
        case .type: return Images.unknown
        case .gender: return Images.gender
        case .origin: return Images.galaxy
        case .location: return Images.locationsIcon
        case .episodes: return Images.epsodesIcon
        }
    }
}

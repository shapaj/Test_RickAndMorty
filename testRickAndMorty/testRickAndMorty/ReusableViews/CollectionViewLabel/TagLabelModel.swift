//
//  TagLabelModel.swift
//  AndersenTeams
//
//  Created by anduser on 26.05.2022.
//

import UIKit

struct TagLabelModel {
    let title: String
    var episode: Episode?
    let textColor: UIColor
    let bacgroundColor: UIColor
    let borderColor: UIColor
    let borderWidth: Int
    let complition: TagOnTapComplition?
    
    init(episode: Episode?,
         textColor: UIColor = Colors.darkGreen,
         bacgroundColor: UIColor = Colors.lightGreenBackground ,
         borderColor: UIColor = UIColor.clear,
         borderWidth: Int = 0,
         complition: TagOnTapComplition? = nil) {
        
        if let episode = episode {
            self.title = episode.name
            self.episode = episode
        } else {
            self.title = " all..."
        }
        self.textColor = textColor
        self.bacgroundColor = bacgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.complition = complition
    }
}

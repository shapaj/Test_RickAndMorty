//
//  EpisodeCell.swift
//  testRickAndMorty
//
//  Created by anduser on 06.07.2022.
//

import UIKit
import Nuke


class EpisodeViewCell: UITableViewCell, InterfaceUpdatable {
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    func updateInterface(_ model: Any) {
//        print(model)
//    }
   
    func updateInterface(viewModel: Any) {
        print(viewModel)
    }
    
    
}

//
//  CharacterEpisodesCell.swift
//  testRickAndMorty
//
//  Created by anduser on 06.06.2022.
//

import UIKit

class CharacterEpisodesCell: UITableViewCell {
    
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        clearElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        clearElements()
    }
    
    
    private func setup() {
        contentView.frame = CGRect(x: 0, y: 0, width: 414, height: 80)
        label.font = .systemFont(ofSize: 20)
        
        contentView.addSubview(label)

        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    private func clearElements() {
        label.text = "lorel ipsum, lorel ipsum"
    }
}

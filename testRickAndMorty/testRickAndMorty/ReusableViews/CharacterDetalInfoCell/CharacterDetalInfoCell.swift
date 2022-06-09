//
//  CharacterDetalInfoCell.swift
//  testRickAndMorty
//
//  Created by anduser on 03.06.2022.
//

import UIKit
import SnapKit

class CharacterDetalInfoCell: UITableViewCell, UpToDatable {
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
        contentView.backgroundColor = .clear
        label.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.frame = CGRect(x: 0, y: 0, width: 414, height: 40)
        label.font = .systemFont(ofSize: 20)
        label.textColor = Colors.darkGreen
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    private func clearElements() {
        label.text = nil
    }

    func updateInterface(_ model: Any) {
        if let model = model as? CharacterDetalInfoCellViewModel {
            label.text = model.title
        }
    }
}

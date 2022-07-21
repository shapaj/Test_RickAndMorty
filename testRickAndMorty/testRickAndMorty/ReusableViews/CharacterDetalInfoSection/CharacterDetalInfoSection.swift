//
//  CharacterDetalInfoSection.swift
//  testRickAndMorty
//
//  Created by anduser on 03.06.2022.
//

import UIKit
import SnapKit

class CharacterDetalInfoSection: UITableViewHeaderFooterView, InterfaceUpdatable {
    
    let label = UILabel()
    let icon = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
   
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
        contentView.frame = CGRect(x: 0, y: 0, width: 414, height: 15)
        label.font = .systemFont(ofSize: 15)
        
        contentView.addSubview(icon)
        icon.tintColor = Colors.darkGreen
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().inset(5)
            make.height.width.equalTo(15)
        }

        contentView.addSubview(label)
        label.numberOfLines = 1
        label.textColor = Colors.lightGreen
        label.snp.makeConstraints { make in
            make.left.equalTo(icon.snp.right).offset(5)
            make.right.equalToSuperview().inset(5)
            make.centerY.equalTo(icon.snp.centerY)
        }
    }
    
    private func clearElements() {
        label.text = nil
        icon.image = Images.portal
    }
    
    func updateInterface(viewModel model: Any) {
        if let model = model as? CharacterDetalInfoSectionViewModel {
            icon.image = model.type.getIcon()
            label.text = model.type.rawValue
        }
    }
}

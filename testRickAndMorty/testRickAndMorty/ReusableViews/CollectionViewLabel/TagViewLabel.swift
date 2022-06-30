//
//  TagViewLabel.swift
//  AndersenTeams
//
//  Created by anduser on 26.05.2022.
//

import UIKit
import SnapKit



class TagViewLabel: UICollectionViewCell {
    
    private var episode: Episode?
    private var label = UILabel()
    private var complition: TagOnTapComplition?
    private var url: URL?
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 180, height: 30))
        
        setupIntarface()
        setActions()
    }
    
    override func prepareForReuse() {
        label.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIntarface() {
        layer.cornerRadius = 3
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(3)
        }
    }
    
    func setActions() {
        let action = UITapGestureRecognizer(target: self, action: #selector(labelTap))
        label.addGestureRecognizer(action)
        label.isUserInteractionEnabled = true
    }
    
    @objc func labelTap() {
        complition?(episode)
    }
    
    static func defaultIdentifier() -> String {
        return String(describing: Self.self)
    }
    
    func updateInterface(with model: TagLabelModel) {
        label.text = model.title
        label.font = .systemFont(ofSize: 18)
        label.textColor = model.textColor
        label.backgroundColor = model.bacgroundColor
        self.backgroundColor = model.bacgroundColor
        
        if model.borderWidth > 0 {
            self.layer.borderColor = model.borderColor.cgColor
            self.layer.borderWidth = CGFloat(model.borderWidth)
        }
        
        episode = model.episode
        complition = model.complition
    }
}

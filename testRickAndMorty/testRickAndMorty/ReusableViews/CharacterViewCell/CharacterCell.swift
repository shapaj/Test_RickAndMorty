//
//  CharacterViewCell.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import UIKit

class CharacterViewCell: UITableViewCell {

    private var image: UIImageView {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        contentView.addSubview(image)
       
        image.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(65)
            make.height.equalTo(80)
        }
        return image
    }
    
    private var name: UILabel {
        let name = UILabel()
        name.font = .systemFont(ofSize: 20)
        contentView.addSubview(name)
       
        name.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).inset(-8)
            make.top.equalToSuperview()
            make.height.equalTo(20)
            make.right.equalToSuperview().inset(8)
        }
        return name
    }
    
    private var episodes: UILabel {
        let episodes = UILabel()
        episodes.font = .systemFont(ofSize: 14)
        episodes.contentMode = .topLeft
        contentView.addSubview(episodes)
        
        episodes.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).inset(-8)
            make.top.equalTo(name.snp.bottom)//.inset(8)
            make.height.equalTo(20)
            make.right.equalToSuperview().inset(8)
        }
        return episodes
    }
    
    private var status: UIProgressView {
        let status = UIProgressView()
        contentView.addSubview(status)

        status.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).inset(-8)
            make.top.equalTo(episodes.snp.bottom).inset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(5)
            make.height.equalTo(5)
        }
        return status
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clearElements()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.frame = CGRect(x: 0, y: 0, width: 414, height: 80)
    }
    
    override func prepareForReuse() {
        clearElements()
    }
    
    private func clearElements() {
        image.image = UIImage(named: "Portal")
        name.text = "name lorem ipsum"
        episodes.text = "episodes lorem ipsum"
        status.progress = 55
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

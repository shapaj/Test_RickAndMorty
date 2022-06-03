//
//  CharacterViewCell.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import UIKit

class CharacterViewCell: UITableViewCell {

    private var imageURL: URL?
    private var image: UIImageView = UIImageView()
    private var name: UILabel = UILabel()
    private var episodes: UILabel = UILabel()
    private var status: UIProgressView = UIProgressView()
    
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
        image.contentMode = .scaleAspectFit
        contentView.addSubview(image)
       
        image.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        
        name.font = .systemFont(ofSize: 20)
        contentView.addSubview(name)
       
        name.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).inset(-8)
            make.top.equalToSuperview().inset(5)
            make.height.equalTo(20)
            make.right.equalToSuperview().inset(8)
        }
        
        episodes.font = .systemFont(ofSize: 14)
        episodes.contentMode = .topLeft
        contentView.addSubview(episodes)
        
        episodes.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).inset(-8)
            make.top.equalTo(name.snp.bottom)//.inset(8)
            make.height.equalTo(20)
            make.right.equalToSuperview().inset(8)
        }
        
        contentView.addSubview(status)
        status.tintColor = Colors.darkGreen
        status.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).inset(-8)
            make.top.equalTo(episodes.snp.bottom).inset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(5)
            make.height.equalTo(5)
        }
        
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
    
    func updareInterface(viewModel: CharacterCellViewModel) {
        imageURL = viewModel.imageURL
        name.text = viewModel.name
        episodes.text = viewModel.episodes
        status.progress = viewModel.progressValue
        
        if let url =  viewModel.imageURL {
            let queue = OperationQueue()
            queue.qualityOfService = .background
            queue.addOperation {
               NetworkManager.shared.getImage(by: url) { [weak self] result in
                    OperationQueue.main.addOperation {
                        self?.image.image = result
                    }
                }
            }
        }
    }
}

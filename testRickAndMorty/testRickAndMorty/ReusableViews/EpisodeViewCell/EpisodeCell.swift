//
//  EpisodeCell.swift
//  testRickAndMorty
//
//  Created by anduser on 06.07.2022.
//

import UIKit
import SnapKit

class EpisodeViewCell: UITableViewCell, BasicTableCell {
   
    var handler: (() -> Void)?
    static var height: CGFloat = CGFloat(80)
    let episodeLabel: UILabel = UILabel()
    let air_dateLabel:  UILabel = UILabel()
    let nameLabel: UILabel = UILabel()
    let goToCharactersButton: UIButton = UIButton()
    var tableView: UITableView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        clearElements()
    }
    
    
    func updateTabel() {
        if contentView.frame.size.height == 300 {
            
            tableView = UITableView()
            guard let tableView = tableView else { return }
            contentView.addSubview(tableView)
            tableView.snp.makeConstraints({ make in
                make.left.right.equalToSuperview().inset(5)
                make.top.equalTo(75)
                make.bottom.equalToSuperview().inset(5)
            })
            tableView.backgroundColor = .red
        } else {
            tableView = nil
        }
        self.layoutIfNeeded()
        print(123)
    }
    
    
    func clearElements() {
        episodeLabel.text = nil
        air_dateLabel.text = nil
        nameLabel.text = nil
    }
    
    func setup() {
        
        contentView.frame = CGRect(x: 0, y: 0, width: 414, height: 80)
        contentView.addSubview(episodeLabel)
        episodeLabel.textAlignment = .left
        episodeLabel.textColor = Colors.darkGreen
        episodeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(20)
        }

        contentView.addSubview(air_dateLabel)
        air_dateLabel.textAlignment = .right
        
        air_dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(5)
            make.left.equalTo(episodeLabel.snp.right).inset(10)
            make.height.equalTo(20)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.textAlignment = .left
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(5)
            make.left.equalToSuperview().inset(5)
            make.height.equalTo(20)
        }
        
        contentView.addSubview(goToCharactersButton)
        goToCharactersButton.setTitleColor(Colors.lightGreen, for: .normal)
        goToCharactersButton.setTitle("showCharacters.text".lowercased(), for: .normal)
        goToCharactersButton.titleLabel?.textAlignment = .left
        goToCharactersButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.height.equalTo(20)
            make.left.right.equalToSuperview()
        }
        
       
        goToCharactersButton.addTarget(self, action: #selector(goToEpisodeTaped), for: .touchUpInside)
//            .addTarget(Any?, action: Selector, for: UIControl.Event)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func updateInterface(viewModel: Any) {
        guard let viewModel = viewModel as? EpisodeCellViewModel else { return }
        
        episodeLabel.text = viewModel.episode
        nameLabel.text = viewModel.name
        air_dateLabel.text = viewModel.air_date
    }
    
    @objc func goToEpisodeTaped(sender: UITapGestureRecognizer) {
        handler?()
    }
}

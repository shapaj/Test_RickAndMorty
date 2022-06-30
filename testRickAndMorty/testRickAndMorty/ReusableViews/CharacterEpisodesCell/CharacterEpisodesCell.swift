//
//  CharacterEpisodesCell.swift
//  testRickAndMorty
//
//  Created by anduser on 06.06.2022.
//

import UIKit

typealias TagOnTapComplition = (Episode?) -> Void

class CharacterEpisodesCell: UITableViewCell {
    
    private let episodesDataSource = TagsViewDataSource()
    private var episodes: UICollectionView!
    
    
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
        contentView.frame = CGRect(x: 0, y: 0, width: 414, height: 160)
        
        

        setupEpisodes()
    }
    
    private func setupEpisodes() {
        
        episodes = UICollectionView(frame: contentView.bounds, collectionViewLayout: TagsLayout())
        episodes.register(TagViewLabel.self, forCellWithReuseIdentifier: TagViewLabel.defaultIdentifier())
        episodes.contentMode = .left
        episodes.scrollsToTop = false
        episodes.showsVerticalScrollIndicator = false
        episodes.showsHorizontalScrollIndicator = false
        episodes.isScrollEnabled = false
        episodes.semanticContentAttribute = .forceLeftToRight
        episodes.dataSource = episodesDataSource
        episodes.delegate = episodesDataSource
        (episodes.collectionViewLayout as? TagsLayout)?.maxLines = 3
        
        contentView.addSubview(episodes)
        
        episodes.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    private func clearElements() {
        (episodes.dataSource as? TagsViewDataSource)?.viewModel = []
        episodes.removeFromSuperview()
        setupEpisodes()
    }
    
    func updateInterface(_ model: Any, complition: @escaping TagOnTapComplition) {
        if let model = model as? [Episode] {
            (episodes.dataSource as? TagsViewDataSource)?.viewModel = model.prefix(4).compactMap { TagLabelModel(episode: $0, complition: complition)
                
             }
            (episodes.dataSource as? TagsViewDataSource)?.viewModel.append(TagLabelModel(episode: nil, textColor: .black, bacgroundColor: Colors.darkOrange, complition: complition))
            
            episodes.reloadData()
        }
    }
}

class TagsViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var viewModel: [TagLabelModel] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagViewLabel.defaultIdentifier(), for: indexPath) as? TagViewLabel else { return UICollectionViewCell() }

        cell.updateInterface(with: viewModel[indexPath.row])
        
        return cell
    }
}

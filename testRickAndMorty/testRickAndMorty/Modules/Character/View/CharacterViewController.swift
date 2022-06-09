//
//  CharacterViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit
import SnapKit
import Nuke

final class CharacterViewController: UIViewController, CharacterViewProtocol, CommonNavigationBarDelegate {
    
    var presenter: CharacterPresenterProtocol!
    private var viewModel: CharacterViewModel?
    private var sections: [CharacterDetalInfoSectionViewModel] = []
    private var episodes: [Episode] = []
    
    private var navigationBar: CommonNavigationBar!
    private let scrollView: UIScrollView = UIScrollView()
    private let scrollContentView: UIView = UIView()
    private let photo: UIImageView = UIImageView()
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.background
        setupNavigationBar()
        setupImage()
        setupScrollView()
        setupcontentView()
        setupTable()
    }
    
    private func setupNavigationBar() {
        navigationBar = CommonNavigationBar()
        navigationBar.backgroundColor = Colors.background
        navigationBar.delegate = self
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setupcontentView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(scrollContentView)
        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
        scrollContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().offset(-16)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(view.bounds.height * 3 / 8 + CGFloat(min(view.bounds.height * (6 / 8),  500)))
        }
    }
    
    private func setupImage() {
        view.addSubview(photo)
        photo.image = Images.portal
        photo.contentMode = .scaleAspectFit
        photo.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.bounds.height * 3 / 8)
        }
    }
    
    private func setupTable() {
        tableView.separatorStyle = .none
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 8
        }
        
        scrollContentView.addSubview(tableView)
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = UIView()
        tableView.backgroundView?.backgroundColor = Colors.background
        tableView.backgroundView?.alpha = 0.85
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        tableView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(min(view.bounds.height * (6 / 8),  500) - 8)
        }
        tableView.register(CharacterDetalInfoCell.self, forCellReuseIdentifier: "CharacterDetalInfoCell")
        tableView.register(CharacterDetalInfoSection.self, forHeaderFooterViewReuseIdentifier: "CharacterDetalInfoSection")
        tableView.register(CharacterEpisodesCell.self, forCellReuseIdentifier: "CharacterEpisodesCell")
    }
    
    // MARK: CommonNavigationBarDelegate
    
    func navigationBarLeftButton() {
        presenter.navigationBarLeftButton()
    }
    
    // MARK: CharacterViewProtocol
    
    func updateInterface(viewModel: Any) {
//        if let image = viewModel as? UIImage {
//            photo.image = image
//        } else
        if let character = viewModel as? CharacterViewModel {
            setChatacterInfo(character: character)
        } else if let episodes = viewModel as? [Episode] {
            self.episodes = episodes
            tableView.reloadData()
        }
    }
    
    private func setChatacterInfo(character: CharacterViewModel) {
        self.viewModel = character
        
        loadImage(with: character.imageURL, into: photo)

        navigationBar.setModel(model: character.navigationBarModel)
        sections = character.sections
        tableView.reloadData()
    }
    
    // MARK: CharacterRouterProtocol
    
    func showPrevious() {
        OperationQueue.main.addOperation {
            self.dismiss(animated: true)
        }
    }
    
    func pushEpisodeView(episode: Episode) {
        OperationQueue.main.addOperation { [weak self] in
            self?.present(EpisodeAssembly.createModule(episode: episode), animated: true)
        }
    }
    
    func presentEpisodes(character: Character) {
        NavigationManager.shared.presentEpisodes(by: character)
    }
    
}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CharacterDetalInfoSection") as? CharacterDetalInfoSection else { return nil }
        
        header.updateInterface(sections[section])
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section].type == .episodes {
            return 1
        } else {
            return sections[section].cells.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if sections[indexPath.section].type == .episodes {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterEpisodesCell") as? CharacterEpisodesCell else { return UITableViewCell() }
            
            cell.updateInterface(episodes) { [weak self] episode in
                self?.presenter.tagTithURLTaped(episode: episode)
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDetalInfoCell") as? CharacterDetalInfoCell else { return UITableViewCell() }
            
            cell.updateInterface(sections[indexPath.section].cells[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].type == .episodes {
            return CGFloat(160)
        } else {
            return CGFloat(40)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return  .zero
    }
}

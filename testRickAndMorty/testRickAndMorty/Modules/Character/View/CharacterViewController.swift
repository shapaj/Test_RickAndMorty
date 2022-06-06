//
//  CharacterViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit
import SnapKit

final class CharacterViewController: UIViewController, CharacterViewProtocol, CommonNavigationBarDelegate {
    
    var presenter: CharacterPresenterProtocol!
    var viewModel: CharacterViewModel?
    var sections: [UserInfoSectionViewModel]?
    
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
        navigationBar.delegate = self
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }
    }
    
    private func setupScrollView() {
//        scrollView.alpha = 0.3
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
            make.height.equalTo(view.bounds.height / 4 + CGFloat(view.bounds.height * 6/8))
        }
    }
    
    private func setupImage() {
        view.addSubview(photo)
        photo.image = Images.portal
        photo.contentMode = .scaleAspectFit
        photo.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.bounds.height / 4)
        }
    }
    
    private func setupTable() {
        scrollContentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        
        tableView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(view.bounds.height * 6 / 8)
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
        if let image = viewModel as? UIImage {
            photo.image = image
        } else if let character = viewModel as? CharacterViewModel {
            setChatacterInfo(character: character)
        } else if let episodes = viewModel as? [Episode] {
            print(episodes)
            tableView.reloadData()
        }
    }
    
    private func setChatacterInfo(character: CharacterViewModel) {
        self.viewModel = character
//        navigationBar.setModel(title: character.name )
        
        tableView.reloadData()
        
    }
    // MARK: CharacterRouterProtocol
    
    func showPrevious() {
        OperationQueue.main.addOperation {
            self.dismiss(animated: true)
        }
    }
    
}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CharacterDetalInfoSection") as? CharacterDetalInfoSection else { return nil }
        
        return header
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String
        if sections?[indexPath.section].type == .episodes {
            cellIdentifier = "CharacterEpisodesCell"
        } else {
            cellIdentifier = "CharacterDetalInfoCell"
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else { return UITableViewCell() }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections?[indexPath.section].type == .episodes {
            return CGFloat(80)
        } else {
            return CGFloat(60)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return  .zero//.leastNormalMagnitude
    }

}

struct UserInfoSectionViewModel {
    ///
    let type: UserInfoSectionTipes
    
    
    init(type: UserInfoSectionTipes) {
        self.type = type
    }
}

enum UserInfoSectionTipes {
    
    case status
    case species
    case type
    case gender
    case origin
    case location
    case episodes
    
    func geticon() -> UIImage? {
        switch self {
        case .status: return Images.portal
        case .species: return Images.portal
        case .type: return Images.portal
        case .gender: return Images.portal
        case .origin: return Images.portal
        case .location: return Images.portal
        case .episodes: return Images.portal
        }
    }
}

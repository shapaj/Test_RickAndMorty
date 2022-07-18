//
//  EpisodesViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit

final class EpisodesViewController: BasicHomeViewController<EpisodeViewCell>, EpisodesViewProtocol {
    
    var viewModel: EpisodesViewModel?
    var tableController: BasicTableController<EpisodeViewCell>?
    
    private var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
    
    var presenter: EpisodesPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func setupTable() {
        tableController = BasicTableController<EpisodeViewCell>(view: self)
        tableView.delegate = tableController
        tableView.dataSource = tableController
    }
    
    override func tapGoTopView(_ sender: UITapGestureRecognizer) {
        presenter?.goToTopTapped()
    }
    
    override func tableViewDidSelectRowAt(indexPath: IndexPath) {
        super.tableViewDidSelectRowAt(indexPath: indexPath)
    }
    
    override func getNextPage() {
        super.getNextPage()
    }
    
    override func scrolledTop(isHidden: Bool) {
        super.scrolledTop(isHidden: isHidden)
    }
    
}



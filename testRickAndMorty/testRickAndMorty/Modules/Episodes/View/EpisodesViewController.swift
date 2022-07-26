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
        tableView.register(EpisodeViewCell.self, forCellReuseIdentifier: EpisodeViewCell.getIdentifier())
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
    
    override func cellTaped(indexPath: IndexPath) {
        presenter?.cellTaped(indexPath: indexPath)
    }
    
    override func scrolledTop(isHidden: Bool) {
        super.scrolledTop(isHidden: isHidden)
    }
    
    func updateInterface(viewModel: Any) {
        if let episodes = viewModel as? EpisodesViewModel {
            tableController?.viewModel = episodes.episodeCells
            tableView.reloadData()
        } else if  let indexPath = viewModel as? IndexPath {
            
            if let tableDelegate = tableView.delegate as? BasicTableController<EpisodeViewCell> {
                tableDelegate.stretchableCellIndexPath = indexPath
//                tableView.increaseSize(Any?)
                tableView.beginUpdates()
                tableView.endUpdates()
//                tableView.deleteRows(at: [indexPath], with: .none)
            //tableView.insertRows(at: [indexPath], with: .none)
//                tableView.reloadData()
                tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        } else {
            print("error model")
        }
        
        
        
    }
}



//
//  EpisodesViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit


final class EpisodesViewController: BaseViewController, EpisodesViewProtocol {
    
    var viewModel: EpisodesViewModel?
    private var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
    let imageView = UIImageView()
    private var goTopView: UIImageView = UIImageView()
    private var tableView: UITableView = UITableView()
    let tableHeaderView = UIView()
    
    var presenter: EpisodesPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
    }
    
}

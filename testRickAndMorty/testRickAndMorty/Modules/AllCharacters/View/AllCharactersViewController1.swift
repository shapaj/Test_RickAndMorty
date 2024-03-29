//
//  AllCharactersViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import UIKit
import SnapKit

final class AllCharactersViewController1: BaseViewController, AllCharactersViewProtocol,
                                            UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    
    var presenter: AllCharactersPresenterProtocol!
    var viewModel: AllCharactersViewModel?
    let searchController = UISearchController(searchResultsController: nil)
    let imageView = UIImageView()
    private var goTopView: UIImageView = UIImageView()
    private var tableView: UITableView = UITableView()
    let tableHeaderView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
        view.backgroundColor = Colors.background
    }
    
    override func viewWillAppear(_ animated: Bool) { }
    
    private func setupUI() {
        setupImage()
        setupScrollView()
        setupTable()
        setupTableGoTopView()
    }
    
    private func setupScrollView() {
        
    }
    
    private func setupTableGoTopView() {
        
        view.addSubview(goTopView)
        goTopView.isHidden = true
        goTopView.image = Images.portal
        goTopView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.right.equalToSuperview().inset(15)
        }
        goTopView.isUserInteractionEnabled = true
        goTopView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGoTopView(_:))))
    }
    
    @objc func tapGoTopView(_ sender: UITapGestureRecognizer) {
        presenter.goToTopTapped()
    }
    
    private func setupImage() {
        imageView.contentMode = .scaleAspectFit
        let image = Images.RickAndMortyText
        imageView.image = image
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.left.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }
    }
    
    private func setupTable() {

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(52)
//            (imageView.snp.bottom).inset(-8)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: "CharacterViewCell")
        
        
        
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Candies"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = false
//        
////        navigationItem.hidesSearchBarWhenScrolling = true
//        
//        searchController.searchBar.sizeToFit()
//        tableView.tableHeaderView = tableHeaderView
//        
//        tableHeaderView.snp.makeConstraints { make in
//            make.height.equalTo(52)
//            make.width.equalTo(tableView.snp.width)
//        }
//        tableHeaderView.addSubview(searchController.searchBar)
//        searchController.searchBar.sizeToFit()
////        searchViewController.searchBar
////        tableView.tableHeaderView = searchViewController.searchBar
//        
////        searchController.hidesNavigationBarDuringPresentation = false
////        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.searchBar.showsCancelButton = false
////        searchBar.
////        NavigationManager
////        self.navigationController?.navigationItem.searchController = searchViewController
////        searchViewController.hidesNavigationBarDuringPresentation = false
////        tableView.tableHeaderView = searchController.searchBar
//        tableView.tableHeaderView = tableHeaderView
//        
//        
//        //        tableView.tableHeaderView?.snp.makeConstraints({ make in
////
////        })
////        tableHeaderView
////        tableView.tableHeaderView?.isHidden = false
//        
//        view.layoutIfNeeded()
        
    
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        tableView.setContentOffset(CGPoint(x: 0, y: 52), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    func updateInterface(viewModel: AllCharactersViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func presentCharacterView(character: Character) {
        let characterView = CharacterAssembly.createModule(character: character)
        characterView.modalPresentationStyle = .fullScreen
        navigationController?.present(characterView, animated: true)
    }
    
    func showGoToTop() {
        goTopView.isHidden = false
    }
    
    func scrollTableToTop() {
        //tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
//        tableView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        goTopView.isHidden = true
    }
    
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print(searchBar.isFocused)
        print(1)
//
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        return true
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        tableView.tableHeaderView?.isHidden = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        tableView.tableHeaderView?.isHidden = false
    }
}


extension AllCharactersViewController1: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    override var prefersStatusBarHidden: Bool {
        true
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characterCells.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        presenter.tableViewdidSelectRowAt(indexPath)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell") as? CharacterViewCell,
              let cellmodel = viewModel?.characterCells[indexPath.row] else { return UITableViewCell() }
        
        if indexPath.row + 1 == viewModel?.characterCells.count {
            
            presenter.getNextCharacters()
        }
        goTopView.isHidden = indexPath.row < 20
        
        cell.updateInterface(viewModel: cellmodel)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    }
}

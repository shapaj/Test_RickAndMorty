//
//  AllCharactersViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import UIKit
import SnapKit

final class AllCharactersViewController3: BaseViewController, AllCharactersViewProtocol,
                                            UISearchBarDelegate {
    
    var presenter: AllCharactersPresenterProtocol!
    var viewModel: AllCharactersViewModel?
    private var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
    let imageView = UIImageView()
    private var goTopView: UIImageView = UIImageView()
    private var tableView: UITableView = UITableView()
    let tableHeaderView = UIView()
    
    
    var aaa: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aaa = UIBarButtonItem(title: "filter", style: .plain, target: self, action: #selector(filterTaped))
        presenter.viewDidLoad()
        setupUI()
        view.backgroundColor = Colors.background
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) { }
    
    private func setupUI() {
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "filter", style: .plain, target: self, action: #selector(filterTaped))
        setupImage()
        setupScrollView()
        setupTable()
        setupTableGoTopView()
    }
    
    @objc func filterTaped() {
        
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
            make.top.equalTo(imageView.snp.bottom).inset(-8)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: "CharacterViewCell")
        tableView.tableHeaderView = tableHeaderView
        
        tableHeaderView.snp.makeConstraints({ make in
            make.height.equalTo(52)
            make.width.equalTo(tableView.snp.width)
        })
        
        tableHeaderView.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(4)
        }
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.setContentOffset(CGPoint(x: 0, y: 52), animated: true)
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
        tableView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        goTopView.isHidden = true
    }
    
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
//        tableView.tableHeaderView?.isHidden = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchBar.text ?? "")
        
        presenter.getCharacters(name: searchBar.text)
    }
}

extension AllCharactersViewController3: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
//    override var prefersStatusBarHidden: Bool {
//        true
//    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characterCells.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) { }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) { }
}

//
//  AllCharactersViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import UIKit
import SnapKit

final class AllCharactersViewController: UIViewController, AllCharactersViewProtocol {
    
    var presenter: AllCharactersPresenterProtocol!
    var viewModel: AllCharactersViewModel?
    
    let imageView = UIImageView()
    
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
        view.backgroundColor = Colors.background
    }
    
    override func viewWillAppear(_ animated: Bool) { }
    
    private func setupUI() {
        setupImage()
        setupTable()
    }
    
    private func setupImage() {
        imageView.contentMode = .scaleAspectFit
        let image = Images.RickAndMortyText
        imageView.image = image
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
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
    }
    
    func updateInterface(viewModel: AllCharactersViewModel) {
        self.viewModel = viewModel
//        tableView.row
        tableView.reloadData()
    }
    
    func presentCharacterView(character: Character) {
        let characterView = CharacterAssembly.createModule(character: character)
        characterView.modalPresentationStyle = .fullScreen
        navigationController?.present(characterView, animated: true)
    }
}

extension AllCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characterCells.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
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
        
        cell.updareInterface(data: cellmodel)
        
        return cell
    }
}

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
    var viewModel: [CharacterCellViewModel] = []
    
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
        setupTable()
    }
    
    private func setupTable() {
        
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
    
    func updateInterface(viewModel: [CharacterCellViewModel]) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
    func presentCharacterView(character: Character) {
        let characterView = CharacterAssembly.createModule()
        characterView.modalPresentationStyle = .fullScreen
        navigationController?.present(characterView, animated: true)
    }
}

extension AllCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.count//.characterCells.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tableViewdidSelectRowAt(indexPath)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell") as? CharacterViewCell else { return UITableViewCell() }
        
        cell.updareInterface(viewModel: viewModel[indexPath.row])
        
        return cell
    }
}

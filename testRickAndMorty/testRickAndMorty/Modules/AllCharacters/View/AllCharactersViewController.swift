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
    
    private var navigationBar: UINavigationBar {
        let navigationBar = UINavigationBar()
//
//        view.addSubview(navigationBar)
//
//        navigationBar.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.left.equalToSuperview().inset(8)
//            make.right.equalToSuperview().inset(8)
//            make.height.equalTo(44)
//        }
        
        
        
//        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
//        view1.backgroundColor = UIColor.blue
////        view.addSubview(view1)
////        view1.snp.makeConstraints { make in
////                    make.top.equalTo(view.safeAreaLayoutGuide)
////                    make.left.equalToSuperview().inset(8)
////                    make.right.equalToSuperview().inset(8)
////                    make.height.equalTo(44)
////                }
//        self.navigationItem.titleView = view1
       
        return navigationBar
    }
    
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
        view.backgroundColor = Colors.background


        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    private func setupUI() {
        setupTable()
    }
    
    private func setupTable() {
        
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "RickAndMortyText")
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
}

extension AllCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.count//.characterCells.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell") as? CharacterViewCell else { return UITableViewCell() }
        
        cell.updareInterface(viewModel: viewModel[indexPath.row])
        
        return cell
    }
}

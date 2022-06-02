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
    
    private var navigationBar: UINavigationBar {
        let navigationBar = UINavigationBar()
        
        view.addSubview(navigationBar)
        navigationBar.backgroundColor = UIColor.blue
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }
        return navigationBar
    }
    
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = Colors.background
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    private func setupUI() {
        setupTable()
    }
    
    private func setupTable() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
            make.top.equalTo(navigationBar.snp.bottom)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: "CharacterViewCell")
    }
}

extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell") as? CharacterViewCell else { return UITableViewCell() }
        
        return cell
    }
}

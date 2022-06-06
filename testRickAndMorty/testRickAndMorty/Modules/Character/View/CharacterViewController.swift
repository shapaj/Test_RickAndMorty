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
    
    private var navigationBar: CommonNavigationBar!
    private let scrollView: UIScrollView = UIScrollView()
    private let scrollContentView: UIView = UIView()
    private let image: UIImageView = UIImageView()
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        navigationBar = CommonNavigationBar(model: CommonNavigationBarModel.mock())
        navigationBar.delegate = self
        view.addSubview(navigationBar)
        navigationBar.backgroundColor = UIColor.orange
//        let leftButton = UINavigationItem(title: InterfaceStrings.Back.rawValue)
//        let rightButton = UINavigationItem(title: InterfaceStrings.Back.rawValue)
        
//        navigationBar.setItems(T##items: [UINavigationItem]?##[UINavigationItem]?, animated: T##Bool)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }
    }
    
    private func setupScrollView() {
        scrollView.backgroundColor = UIColor.yellow
        scrollView.alpha = 0.3
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
        scrollContentView.backgroundColor = UIColor.brown
        scrollContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().offset(-16)
            make.left.right.equalToSuperview().inset(8)
            make.height.equalTo(view.bounds.height / 4 + CGFloat(view.bounds.height * 6/8))
        }
    }
    
    private func setupImage() {
        view.addSubview(image)
        image.image = Images.portal
        image.contentMode = .scaleAspectFit
        image.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.bounds.height / 4)
        }
    }
    
    private func setupTable() {
        scrollContentView.addSubview(tableView)
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view1.backgroundColor = UIColor.green
        tableView.backgroundView = view1
        tableView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(view.bounds.height * 6 / 8)
        }
    }
    
    // MARK: CommonNavigationBarDelegate
    func navigationBarLeftButton() {
        
        // go back
        OperationQueue.main.addOperation {
            self.dismiss(animated: true)
        }
    }
    
}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}




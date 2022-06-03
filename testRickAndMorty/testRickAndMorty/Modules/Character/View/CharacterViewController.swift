//
//  CharacterViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit
import SnapKit

final class CharacterViewController: UIViewController, CharacterViewProtocol {
    
    var presenter: CharacterPresenterProtocol!
    
    private let navigationBar: UINavigationBar = UINavigationBar()
    private let scrollView: UIScrollView = UIScrollView()
    private let scrollContentView: UIView = UIView()
    private let image: UIImageView = UIImageView()
    private var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        image.image = UIImage(named: "Portal")
        setupUI()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupUI() {
        
        view.addSubview(navigationBar)
        navigationBar.backgroundColor = UIColor.orange
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }
        setupImage()
        
        
        scrollView.backgroundColor = UIColor.yellow
        scrollView.alpha = 0.3
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        setupcontentView()
        setupTable()
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
            //            make.right.equalToSuperview().inset(8)
            
            make.height.equalTo(view.bounds.height / 4 + CGFloat(view.bounds.height * 6/8))
        }
        let title = UILabel()
        title.text = "dsknbvfldk j fivsd gkls d  fdvd gds gsd ds gsd gds gg sd  dzg sgg s gsglgdj"
        title.lineBreakMode = .byCharWrapping
        scrollContentView.addSubview(title)
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    private func setupImage() {
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(view.bounds.height / 4)
        }
        image.contentMode = .scaleAspectFit
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
}




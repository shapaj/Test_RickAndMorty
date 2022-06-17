//
//  BasicHomeViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 17.06.2022.
//

import UIKit
import SnapKit

protocol BasicHomePresenterProtocol {
    
}

class BasicHomeViewController: BaseViewController {
    
    var viewModel: BasicTableViewModel?
    private var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
    let imageView = UIImageView()
    private var goTopView: UIImageView = UIImageView()
    private var tableView: UITableView = UITableView()
    let tableHeaderView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        setupUI()
    }
 
    private func setupUI() {
        setupImage()
        setupTable()
        setupTableGoTopView()
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
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(8)
            make.top.equalTo(imageView.snp.bottom).inset(-8)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: "CharacterViewCell")
        view.layoutIfNeeded()
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
}

extension BasicHomeViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
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
            
//        if indexPath.row == 1 {
//            tableView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//            scrollTableToTop()
//        }
        goTopView.isHidden = indexPath.row < 20
        
        cell.updareInterface(data: cellmodel)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {    }
}


struct BasicTableViewModel: Decodable {
    
    var cells: [BasicTableCell] = []
    
}

class BasicTableCell: UITableViewCell {
    
}

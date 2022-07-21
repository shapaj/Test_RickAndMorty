//
//  BasicHomeViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 17.06.2022.
//

import UIKit
import SnapKit

class BasicHomeViewController<T>: BaseViewController where T: UITableViewCell{
    
    private var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
    let imageView = UIImageView()
    private var goTopView: UIImageView = UIImageView()
    var tableView: UITableView = UITableView()
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
            make.top.equalTo(imageView.snp.bottom).inset(-8)
        }
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: T.getIdentifier())
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
    
    
    @objc func tapGoTopView(_ sender: UITapGestureRecognizer) {
        //presenter?.goToTopTapped()
    }
    func tableViewDidSelectRowAt(indexPath: IndexPath) {}
    func getNextPage() {}
    func scrolledTop(isHidden: Bool) {
        goTopView.isHidden = isHidden
    }
    
    func scrollTableToTop() {
        tableView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        goTopView.isHidden = true
    }
}


class BasicTableController<T>: NSObject, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate where T:UITableViewCell, T:InterfaceUpdatable {
    
    private weak var view: BasicHomeViewController<T>?
    var viewModel: [Any] = []
    
    init(view: BasicHomeViewController<T>) {
        super.init()
        self.view = view
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40//viewModel.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        view?.tableViewDidSelectRowAt(indexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T else { return UITableViewCell() }
        
        if indexPath.row + 2 == viewModel.count {
            view?.getNextPage()
        }
        
        view?.scrolledTop(isHidden: indexPath.row < 20)
        
        cell.updateInterface(viewModel: viewModel[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {    }
}

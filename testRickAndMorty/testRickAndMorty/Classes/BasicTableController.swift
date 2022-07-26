//
//  BasicTableController.swift
//  testRickAndMorty
//
//  Created by anduser on 22.07.2022.
//

import UIKit

protocol HeighDefined {
    static var height: CGFloat { get }
}

protocol BasicTableCell: UITableViewCell, InterfaceUpdatable, HeighDefined {
    var handler: (() -> Void)? { get set }
    
}

class BasicTableController<T>: NSObject, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate where
T:BasicTableCell {
    
    private weak var view: BasicHomeViewController<T>?
    var viewModel: [Any] = []
    var stretchableCellIndexPath: IndexPath?
    
    init(view: BasicHomeViewController<T>) {
        super.init()
        self.view = view
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let stretchableCellIndexPath = stretchableCellIndexPath,
            indexPath == stretchableCellIndexPath {
           return CGFloat(300)
        }
        return T.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        view?.tableViewDidSelectRowAt(indexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: T.getIdentifier()) as? T else { return UITableViewCell() }
        
        if indexPath.row + 2 == viewModel.count {
            view?.getNextPage()
        }
        cell.handler = { [weak view] in
            view?.cellTaped(indexPath: indexPath)
        }
        view?.scrolledTop(isHidden: indexPath.row < 20)
        
        cell.updateInterface(viewModel: viewModel[indexPath.row])
        
        if let stretchableCellIndexPath = stretchableCellIndexPath,
            indexPath == stretchableCellIndexPath {
            cell.backgroundColor = .green
            cell.contentView.backgroundColor = .green
            cell.contentView.frame = CGRect(x: 0, y: 0, width: 414, height: 300)
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {    }
}

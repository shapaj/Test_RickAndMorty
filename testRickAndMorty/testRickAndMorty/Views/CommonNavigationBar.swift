//
//  CommonNavigationBar.swift
//  testRickAndMorty
//
//  Created by anduser on 06.06.2022.
//

import UIKit

class CommonNavigationBar: UINavigationBar {
    
    override var delegate: UINavigationBarDelegate? {
        set {
            self.inoutDelegate = newValue as? CommonNavigationBarDelegate
        }
        get { return self.inoutDelegate }
    }
    
    private var inoutDelegate: CommonNavigationBarDelegate?
    
    init() {
        super.init(frame: CGRect())
        
        // default
        let navigationItem = UINavigationItem(title: "")
        let buttonLeft = UIButton()
        buttonLeft.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        buttonLeft.setTitle("back", for: .normal)
        buttonLeft.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigationBarLeftButton)))
        let leftButton = UIBarButtonItem(customView: buttonLeft)
        navigationItem.leftBarButtonItem = leftButton
        self.setItems([navigationItem], animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func navigationBarLeftButton() {
        inoutDelegate?.navigationBarLeftButton?()
    }
    
    @objc func navigationBarRightButton() {
        inoutDelegate?.navigationBarRightButton?()
    }
    
    func setModel(model: CommonNavigationBarModel) {
        let navigationItem = UINavigationItem(title: model.title)
        
        if model.isLeftButtonUsed {
            let buttonLeft = UIButton()
            
            buttonLeft.setImage(model.leftButtonImage, for: .normal)
            buttonLeft.setTitle(model.leftButtontitle, for: .normal)
            buttonLeft.tintColor = Colors.darkGreen
            buttonLeft.setTitleColor(Colors.darkGreen, for: .normal)
            buttonLeft.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigationBarLeftButton)))
            
            let leftButton = UIBarButtonItem(customView: buttonLeft)
            navigationItem.leftBarButtonItem = leftButton
        }
        
        if model.isRightButtonUsed {
            let buttonRight = UIButton()
        
            buttonRight.setImage(model.rightButtonImage, for: .normal)
            buttonRight.setTitle(model.rightButtontitle, for: .normal)
            buttonRight.tintColor = Colors.darkGreen
            buttonRight.setTitleColor(Colors.darkGreen, for: .normal)
            buttonRight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigationBarRightButton)))
            
            let RightButton = UIBarButtonItem(customView: buttonRight)
            
            navigationItem.rightBarButtonItem = RightButton
        }
        
        self.setItems([navigationItem], animated: false)
    }
    
    
}

@objc protocol CommonNavigationBarDelegate: UINavigationBarDelegate {
    @objc optional func navigationBarLeftButton()
    @objc optional func navigationBarRightButton()

}

struct CommonNavigationBarModel {
    let isLeftButtonUsed: Bool
    let isRightButtonUsed: Bool
    
    var leftButtontitle: String?
    var leftButtonImage: UIImage?
    var rightButtontitle: String?
    var rightButtonImage: UIImage?
    var title: String = ""
    
    init(title: String = "",
         leftButtontitle: String? = "back",
         leftButtonImage: UIImage? = UIImage(systemName: "chevron.left"),
         rightButtontitle: String? = nil,
         rightButtonImage: UIImage? = nil,
         isLeftButtonUsed: Bool = true,
         isRightButtonUsed: Bool = false) {
        
        self.leftButtontitle = leftButtontitle
        self.leftButtonImage = leftButtonImage
        self.rightButtontitle = rightButtontitle
        self.rightButtonImage = rightButtonImage
        self.title = title
        self.isLeftButtonUsed = isLeftButtonUsed
        self.isRightButtonUsed = isRightButtonUsed
    }
    
    static func mock() -> CommonNavigationBarModel {
       
        let model = CommonNavigationBarModel(title: "title",
                                             leftButtontitle: "left",
                                             leftButtonImage: UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate),
                                             
                                             rightButtontitle: "right",
                                             rightButtonImage: UIImage(systemName: "chevron.right"),
                                             isLeftButtonUsed: true,
                                             isRightButtonUsed: true)
        return model
    }
}

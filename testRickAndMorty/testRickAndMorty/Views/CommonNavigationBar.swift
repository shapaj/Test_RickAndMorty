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
//            self.delegate = newValue
            self.inoutDelegate = newValue as? CommonNavigationBarDelegate
        }
        get { return self.inoutDelegate }
    }
    
    private var inoutDelegate: CommonNavigationBarDelegate?
    //CommonNavigationBarDelegate?
    
    
//    ar myDelegate: MyScrollViewDelegate? {
//            get { return self.delegate as? MyScrollViewDelegate }
//            set { self.delegate = newValue }
//        }
    
    init(model: CommonNavigationBarModel) {
        super.init(frame: CGRect())
        let navigationItem = UINavigationItem(title: model.title)
        
        let buttonLeft = UIButton()
        
        buttonLeft.setImage(model.leftButtonImage, for: .normal)
        buttonLeft.setTitle(model.leftButtontitle, for: .normal)
        buttonLeft.tintColor = Colors.darkGreen
        buttonLeft.setTitleColor(Colors.darkGreen, for: .normal)
        

        buttonLeft.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navigationBarLeftButton)))
        
        let leftButton = UIBarButtonItem(customView: buttonLeft)
//        leftButton.style = .plain
//        leftButton.target = self
//        leftButton.action = #selector(navigationBarLeftButton)
        
//
//        UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(navigationBarLeftButton))
       // leftButton.image = model.leftButtonImage
//        leftButton.title = model.title
//        leftButton.tintColor = Colors.darkGreen
        
        navigationItem.leftBarButtonItem = leftButton
       
        let rightButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(navigationBarRightButton))
        rightButton.image = model.rightButtonImage
        navigationItem.rightBarButtonItem = rightButton
        
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
    
    
}

//extension UINavigationBarDelegate {
//    func navigationBarLeftButton() {
//
//    }
//}
//
@objc protocol CommonNavigationBarDelegate: UINavigationBarDelegate {
    @objc optional func navigationBarLeftButton()
    @objc optional func navigationBarRightButton()

}

struct CommonNavigationBarModel {
    var leftButtontitle: String?
    var leftButtonImage: UIImage?
    var rightButtontitle: String?
    var rightButtonImage: UIImage?
    var title: String = ""
    
    init() {
//        model.leftButtonImage?.renderingMode = .alwaysTemplate
    }
    
    static func mock() -> CommonNavigationBarModel {
       
        var model = CommonNavigationBarModel()
        model.leftButtontitle = "left"
        model.leftButtonImage = Images.charactersIcon?.withRenderingMode(.alwaysTemplate)
//        model.leftButtonImage?.renderingMode = .alwaysTemplate
        ///UIImage(systemName: "arrow")
        model.rightButtontitle = "right"
        model.rightButtonImage = UIImage(systemName: "arrow")
        model.title = "title"
        return model
    }
}

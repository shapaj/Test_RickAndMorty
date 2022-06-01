//
//  UIViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit

extension UIViewController {
    func showPortal() {
        
        let portalHight = min(self.view.bounds.size.height, self.view.bounds.size.width)
        
        
        let portal = UIImageView(frame: CGRect(x: 0, y: 0, width: portalHight, height: portalHight))
        
        portal.center = self.view.center
        
        portal.image = UIImage(named: "Portal")
        
        
        self.view.addSubview(portal)
        
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn], animations: {
            portal.bounds.size.height *= 2.0
            portal.bounds.size.width *= 2.0
            
//            let rotation = rotat
            portal.layer.transform = CATransform3DMakeRotation(.pi, 0, 0, 1)
        }, completion: { _ in NavigationManager.shared.presentTabViewController() } )
    
        let animation = CAAnimation()
        
        
//        portal.layer.add
    }
}

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
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [], animations: {
            portal.bounds.size.height *= 0.8
            portal.bounds.size.width *= 0.8
        }, completion: { _ in NavigationManager.shared.presentTabViewController() } )
        
        

        
        
    }
}

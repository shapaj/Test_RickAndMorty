//
//  UIViewController.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import UIKit

extension UIViewController {
    func showPortal(){
        
        let portalHight = min(self.view.bounds.size.height, self.view.bounds.size.width)
        
        
        let portal = UIImageView(frame: CGRect(x: 0, y: 0, width: portalHight, height: portalHight))
        
        portal.center = self.view.center
        
        portal.image = UIImage(named: "Portal")
        
        
        self.view.addSubview(portal)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseIn], animations: {
            portal.bounds.size.height *= 3.0
            portal.bounds.size.width *= 3.0
        })
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 4
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        portal.layer.add(rotation, forKey: "rotationAnimation")
   
    }
    
    func hidePortal() {
        
        self.view.subviews.last?.removeFromSuperview()
    }
}



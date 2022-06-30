//
//  Swipeable.swift
//  testRickAndMorty
//
//  Created by anduser on 16.06.2022.
//

import Foundation
import UIKit

extension BaseViewController: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController,
                               presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SwipeAnimator(originalFrame: self.view.frame, interactionController: "")
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let dismissed = dismissed as? BaseViewController else { fatalError()}
        dismissed.animator = SwipeAnimator(originalFrame: self.view.frame, interactionController: nil)
        return dismissed.animator
    }
}

class SwipeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let originalFrame : CGRect

    required init(originalFrame: CGRect, interactionController: String?) {
        self.originalFrame = originalFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(3.0)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to)//,
//              let snapshotFrom = fromVC.view.snapshotView(afterScreenUpdates: true),
//              let snapshotTo = toVC.view.snapshotView(afterScreenUpdates: true)
        else {
                  return
              }
        
        fromVC.showPortal()
        sleep(3)
        fromVC.hidePortal()
    }
    
    
    
}

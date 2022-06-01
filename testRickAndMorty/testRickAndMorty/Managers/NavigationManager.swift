//
//  NavigationManager.swift
//  testRickAndMorty
//
//  Created by anduser on 30.05.2022.
//

import Foundation
import UIKit

final class NavigationManager {
    
    static let shared: NavigationManager = NavigationManager()
    
    
    func presentTabViewController() {
        
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        keyWindow?.rootViewController = tabBarController() 
        
    }
    
    func tabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let tabBarViewControllers: [UIViewController] = [
            AllCharactersAssembly.tabBarViewController(),
            EpisodesAssembly.tabBarViewController(),
            LocationsAssembly.tabBarViewController()
        ]
        
        tabBarController.tabBar.backgroundColor = nil
        
        let tabBarAppearance = UITabBarAppearance(idiom: .unspecified)
        
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = Colors.lightGreen
        
        let tabbarItemAppearance = UITabBarItemAppearance()
        setTabBarItemColors(tabbarItemAppearance)

        tabBarAppearance.stackedLayoutAppearance = tabbarItemAppearance
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = tabBarController.tabBar.standardAppearance
        }
        
        tabBarController.setViewControllers(tabBarViewControllers, animated: true)
        return tabBarController
    }
    
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white as Any]
        
        itemAppearance.selected.iconColor = Colors.darkGreen
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: Colors.darkGreen as Any]
    }
}

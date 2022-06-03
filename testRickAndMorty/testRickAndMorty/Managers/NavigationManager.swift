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
    
    func presentTabViewController(charactersModel: CharactersModel? = nil) {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        keyWindow?.rootViewController = tabBarController(charactersModel: charactersModel)
        
    }
    
    func tabBarController(charactersModel: CharactersModel? = nil) -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let tabBarViewControllers: [UIViewController] = [
            AllCharactersAssembly.tabBarViewController(charactersModel: charactersModel),
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
        itemAppearance.normal.iconColor = Colors.darkGreen
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: Colors.darkGreen as Any]
        
        itemAppearance.selected.iconColor = UIColor.white
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white as Any]
    }
}

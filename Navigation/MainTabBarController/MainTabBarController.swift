//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Олеся on 27.09.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    private let factory = MyLoginFactory()
    private let feedModel = FeedModel()
private let feedCoord = FeedCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .secondarySystemBackground
        setControllers()
    }
    
    private func setControllers() {
        let feedVC = UINavigationController(rootViewController: FeedViewController(model: feedModel, coordinator: feedCoord)
        )
        let profileVC = UINavigationController(rootViewController: factory.loginViewController())
        feedVC.tabBarItem.image = UIImage(systemName: "rectangle.on.rectangle")
        profileVC.tabBarItem.image = .init(systemName: "person")
        
        profileVC.tabBarItem.title = "Profile"
        viewControllers = [feedVC, profileVC]
        
    }
    
}

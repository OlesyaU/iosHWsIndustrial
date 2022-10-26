//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Олеся on 27.09.2022.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var controller: UIViewController
    var children: [Coordinator] = []
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func setUp() {
        if controller is UINavigationController {
            let vc = MainTabBarController()
            vc.coordinator = self
            
            let factory = MyLoginFactory()
            let feedModel = FeedModel()
            let feedVC =  FeedViewController(model: feedModel)
            feedVC.coordinator = FeedCoordinator(controller: controller)
            feedVC.tabBarItem.image = UIImage(systemName: "rectangle.on.rectangle")
            
            let profileVC =  factory.loginViewController()
            profileVC.coordinator = ProfileCoordinator()
            profileVC.tabBarItem.image = .init(systemName: "person")
            profileVC.tabBarItem.title = "Profile"
            
            vc.viewControllers = [feedVC, profileVC]
            
            let nvc = controller as! UINavigationController
            nvc.pushViewController(vc, animated: false)
        }
    }
}

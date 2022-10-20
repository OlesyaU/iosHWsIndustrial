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
        feedFlowStart()
    }
    
    func setUp() {
        if controller is UINavigationController {
            let vc = MainTabBarController()
            vc.coordinator = self
            
            let factory = MyLoginFactory()
            let feedModel = FeedModel()
            let feedVC =  FeedViewController(model: feedModel)
//            feedVC.coordinator = FeedCoordinator(controller: controller)
//            вот тут не ясно где указывать координатора у этого контроллера
            let profileVC =  factory.loginViewController()
            feedVC.tabBarItem.image = UIImage(systemName: "rectangle.on.rectangle")
            profileVC.tabBarItem.image = .init(systemName: "person")
            profileVC.tabBarItem.title = "Profile"
            vc.viewControllers = [feedVC, profileVC]
            print(feedModel)

            let nvc = controller as! UINavigationController
            nvc.pushViewController(vc, animated: false)
        }
       
    }
    func feedFlowStart() {
        let child = FeedCoordinator(controller: controller)
        child.parentCoordinator = self
        children.append(child)
    }
}

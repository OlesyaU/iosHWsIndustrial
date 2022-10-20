//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Олеся on 28.09.2022.
//

import UIKit

final class FeedCoordinator: Coordinator {
    var controller: UIViewController
    
    var children: [Coordinator] = []
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    
    func setUp() {
        let postVC = PostViewController()
        let wrongVC = WrongViewController()
//        let feedModel = FeedModel()
//        let feedCoordinator = FeedCoordinator()
//        let feedVC = FeedViewController(model: feedModel)
//        feedVC.tabBarItem.image = UIImage(systemName: "rectangle.on.rectangle")
        
//        if result {
//            navController?.pushViewController(postVC, animated: true)
//        } else {
//            navController?.pushViewController(wrongVC, animated: true)
//        }
    }
}

//тут я специально сделала в методе ветвление, на случай если будут разные сценарии в зависимости от того, ввел ли корректно юзер данные или нет. (Кодовое слово - Password)

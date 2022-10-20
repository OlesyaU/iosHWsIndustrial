//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Олеся on 28.09.2022.
//

import UIKit

final class FeedCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var controller: UIViewController
    var children: [Coordinator] = []
    var result: Bool?
    var check: (() -> Bool)?
    
    init(controller: UIViewController) {
        self.controller = controller

    }
    
    
    func setUp() {
        print(check)
//        result = check()
        if controller is UINavigationController {
        let postVC = PostViewController()
        let wrongVC = WrongViewController()
//        let feedModel = FeedModel()
//        let feedCoordinator = FeedCoordinator()
//        let feedVC = FeedViewController(model: feedModel)
//        feedVC.tabBarItem.image = UIImage(systemName: "rectangle.on.rectangle")
//        if controller is UINavigationController {
       
            let nvc =   controller as! UINavigationController
            if check != nil {
                nvc.pushViewController(postVC, animated: true)
                //            navController?.pushViewController(postVC, animated: true)
            } else {
                //            navController?.pushViewController(wrongVC, animated: true)
                nvc.pushViewController(wrongVC, animated: true)
            }
        }
    }
}

//тут я специально сделала в методе ветвление, на случай если будут разные сценарии в зависимости от того, ввел ли корректно юзер данные или нет. (Кодовое слово - Password)

//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Олеся on 28.09.2022.
//

import UIKit

final class ProfileCoordinator {
    
    func profileFlow(navController: UINavigationController, coordinator: ProfileCoordinator, result: Bool) {
        let vc = PostViewController()
        let name = LogInViewController(coordinator: coordinator).getName()
        let uSer = TestUserService()
        let sucsessVC = ProfileViewController(user: uSer, name: name)
        
        if result {
            navController.pushViewController(sucsessVC, animated: true)
        } else {
            vc.view.backgroundColor = .orange
            navController.pushViewController(vc, animated: true)
        }
    }
}

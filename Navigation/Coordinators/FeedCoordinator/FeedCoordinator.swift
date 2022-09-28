//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Олеся on 28.09.2022.
//

import UIKit

final class FeedCoordinator {
    
    func feedFlow(navController: UINavigationController?, coordinator: FeedCoordinator, result: Bool) {
        let postVC = PostViewController()
        
        if result {
            navController?.pushViewController(postVC, animated: true)
        } else {
            postVC.view.backgroundColor = .red
            navController?.pushViewController(postVC, animated: true)
        }
    }
}

//тут я специально сделала в методе ветвление, на случай если будут разные сценарии в зависимости от того, ввел ли корректно юзер данные или нет.Красный экран - нет, розовый- в случае правильного ввода пароля (слово - Password)

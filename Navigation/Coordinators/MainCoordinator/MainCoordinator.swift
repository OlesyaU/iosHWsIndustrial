//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Олеся on 27.09.2022.
//

import UIKit

protocol MainCoordinator {
    func startApplication() -> UIViewController
}

final class MainCoordinatorImpl: MainCoordinator {
    func startApplication() -> UIViewController {
        return MainTabBarController()
        
    }
    
}

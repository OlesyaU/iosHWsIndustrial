//
//  LoginFactory.swift
//  Navigation
//
//  Created by Олеся on 20.06.2022.
//

import Foundation
import UIKit

protocol LoginFactoryProtocol {
    var loginInspector: LoginInspector { get }
    func loginViewController() -> LogInViewController
}

final class MyLoginFactory: LoginFactoryProtocol {
    var loginInspector = LoginInspector()
    
    func loginViewController() -> LogInViewController {
        let profileCoordinator = ProfileCoordinator()
        let loginViewController = LogInViewController(coordinator: profileCoordinator)
        loginViewController.delegate = self.loginInspector
        return loginViewController
    }
}

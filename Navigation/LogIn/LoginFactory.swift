//
//  LoginFactory.swift
//  Navigation
//
//  Created by Олеся on 20.06.2022.
//

import Foundation
import UIKit

protocol LoginFactoryProtocol {
    func getLoginInspector() -> LoginInspector
}

final class MyLoginFactory: LoginFactoryProtocol {
    
    let loginVC = LogInViewController()
    let loginDelegate = LoginInspector()
    func getLoginInspector() -> LoginInspector {
        return loginDelegate
    }
}

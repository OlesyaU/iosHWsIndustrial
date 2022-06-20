//
//  Checker.swift
//  Navigation
//
//  Created by Олеся on 19.06.2022.
//

import Foundation

final class Checker {
    static let shared = Checker()
    private let loginVC = "Вжик"
    private let passwordVC = "Вжик"
    private init () {}
    
    func checkLogData(login: String, password: String) -> Bool {
        if login == loginVC, password == passwordVC {
            print("Из чекера - прошел проверку")
            return true
        } else {
            print("Из чекера -  не прошел проверку")
            return false
        }
    }
    
}

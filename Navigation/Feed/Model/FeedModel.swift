//
//  FeedModel.swift
//  Navigation
//
//  Created by Олеся on 02.07.2022.
//

import Foundation

final class FeedModel: FeedModelProtocol {
    
    private let passwordFeed = "Pas"
    
    func check(word: String) -> Bool {
        let trimmed = word.trimmingCharacters(in: .whitespaces)
        return trimmed == passwordFeed
    }
    
    func getpassword() -> String {
        passwordFeed
    }
}

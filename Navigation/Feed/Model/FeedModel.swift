//
//  FeedModel.swift
//  Navigation
//
//  Created by Олеся on 02.07.2022.
//

import Foundation

final class FeedModel: FeedModelProtocol {
    
   private let passwordFeed = "Password"
    
  func check(word: String) -> Bool {
     word == passwordFeed 
    }
}

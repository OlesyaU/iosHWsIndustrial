//
//  User.swift
//  Navigation
//
//  Created by Олеся on 12.06.2022.
//

import Foundation
import UIKit

final class User {
    
    let fullName: String
    let avatar: UIImage
    let status: String
    
    init(fullName: String, avatar: UIImage, status: String) {
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

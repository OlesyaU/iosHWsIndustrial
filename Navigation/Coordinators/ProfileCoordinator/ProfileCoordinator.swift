//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Олеся on 28.09.2022.
//

import UIKit
final class ProfileCoordinator: Coordinator {
    
    enum Presentation {
        case profile(User)
        case photos
    }
    
    private var user: User?
    private  let loginVC: LogInViewController
    private var profileNC: UINavigationController
    private let service = TestUserService()
    var controller: UIViewController
    
    var children: [Coordinator]
    var login: (()->String)?
    
    var checkResult: (()->Bool)?
    
    
    
    init() {
        children = []
        
        let factory = MyLoginFactory()
        loginVC = factory.loginViewController()
        
        // create tab bar with profile items
        profileNC = UINavigationController(rootViewController: loginVC)
        profileNC.tabBarItem = UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person.crop.circle"),
                                            selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        
        controller = profileNC
    }
    
    func setUp() {
        user = service.getUser(name: login!())
        print(checkResult!())
        guard let user = user else {return}
        print(user)
        if checkResult!() {
            present(.profile(user))
        } else {
            present(.photos)
        }
        
    }
    
    func present(_ presentation: Presentation) {
        switch presentation {
            case .profile(let user):
                let profileVC = ProfileViewController(user:service )
                profileVC.coordinator = self
                profileNC.pushViewController(profileVC, animated: true)
            case .photos:
                profileNC.pushViewController(PhotosViewController(), animated: true)
        }
        
    }
}




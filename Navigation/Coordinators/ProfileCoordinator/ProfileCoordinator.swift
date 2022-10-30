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
    //    var usFind: (()-> User)?
    
    init(controller: UIViewController) {
        self.controller = controller
        children = []
        
        let factory = MyLoginFactory()
        loginVC = factory.loginViewController()
        
        // create tab bar with profile items
        profileNC = UINavigationController(rootViewController: loginVC)
        profileNC.tabBarItem = UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person.crop.circle"),
                                            selectedImage: UIImage(systemName: "person.crop.circle.fill"))
    }
    
    func setUp() {
        user = service.getUser(name: login!())
        print(checkResult!())
        guard let user = user else {return}
        if checkResult!() {
            present(.profile(user))
        } else {
            let wrongVC = WrongViewController()
            controller.navigationController?.pushViewController(wrongVC, animated: true)
        }
    }
    
    func present(_ presentation: Presentation) {
        switch presentation {
            case .profile(let user):
                let profileVC = ProfileViewController(user: user)
                profileVC.coordinator = self
                controller.navigationController?.pushViewController(profileVC, animated: true)
            case .photos:
                controller.navigationController?.pushViewController(PhotosViewController(), animated: true)
                //                controller.navigationController?.pushViewController(WrongViewController(), animated: true)
        }
    }
}




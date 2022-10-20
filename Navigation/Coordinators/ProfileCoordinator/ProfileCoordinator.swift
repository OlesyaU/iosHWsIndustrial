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
    
    var user: User?
    
    var controller: UIViewController
    
    var children: [Coordinator]
    var login: Bool?
    let loginVC: LogInViewController
    var profileNC: UINavigationController
//    разобраться с с логином...а также достать юзера и пушить нужный экран
    
    init() {
        children = []
//        login = false
        // create login service
        let factory = MyLoginFactory()
    loginVC = factory.loginViewController()
        let loginInspector = factory.loginInspector
        loginVC.delegate = loginInspector
        print("из инита в координаторе профиля делегат \(loginVC.delegate)")
        // create tab bar with profile items
        profileNC = UINavigationController(rootViewController: loginVC)
        profileNC.tabBarItem = UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person.crop.circle"),
                                            selectedImage: UIImage(systemName: "person.crop.circle.fill"))
        controller = profileNC
//       setUp()
    }
    
    func setUp() {
        loginVC.coordinator = self
//        let name = loginVC.getName()
     let uSer = TestUserService()
        guard let login = login else {
//            print("login = nil")
            return}
        if login  {
            present(.profile(uSer.user))
            print(#function,#line)
            
        } else {
            present(.photos)
            print(#function,#line)
        }
   }
    
    
    func profileFlow(result: Bool) {
        let name = loginVC.getName()
        guard let uSer = TestUserService().getUser(name: name) else {
            print("its wrong in coordinator")
            return}
     if result {
            present(.profile(uSer))
        } else {
            present(.photos)
        }
    }

    
    func present(_ presentation: Presentation) {

        switch presentation {
            case let .profile(user):
                let profileVC = ProfileViewController(user: user
                                                      as! UserService)
               profileVC.coordinator = self
//                profileNC.setViewControllers([profileVC], animated: true)
//                profileNC.pushViewController(profileVC, animated: true)
               profileNC.pushViewController(profileVC, animated: true)
                children.append(profileVC.coordinator!)
            case .photos:
                profileNC.pushViewController(PhotosViewController(), animated: true)
        }
    }
}





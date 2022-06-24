//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Олеся on 10.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private let tabBar = UITabBarController()
    private let factory = MyLoginFactory()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        setupInitialFlow(with: factory)
        setupNavigationBarAppearance()
        setupTabBarAppearance()

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    
    private func setupNavigationBarAppearance(){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .secondarySystemBackground
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    private func setupTabBarAppearance(){
        UITabBar.appearance().backgroundColor = .secondarySystemBackground
    }
    
    private func setupInitialFlow(with: MyLoginFactory) {
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        let profileVC = UINavigationController(rootViewController: factory.loginViewController())
        feedVC.tabBarItem.image = .init(systemName: "rectangle.on.rectangle")
        profileVC.tabBarItem.image = .init(systemName: "person")
        
        profileVC.tabBarItem.title = "Profile"
        tabBar.viewControllers = [feedVC, profileVC]
    }
}


//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Олеся on 10.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private let mainCoordinator: MainCoordinator = MainCoordinatorImpl()
   
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        setupNavigationBarAppearance()
       
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = mainCoordinator.startApplication()
        window?.makeKeyAndVisible()
    }
    
    private func setupNavigationBarAppearance(){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .secondarySystemBackground
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
}


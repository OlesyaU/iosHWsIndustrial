//
//  FeedViewController.swift
//  Navigation
//
//  Created by Олеся on 14.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    private let button = UIButton()
//    перенести настройки иконки и
//    настройки контроллера в сцен делегейт
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        navigationItem.title = "Feed"
       navigationController?.title = "Feed"
        navigationController?.tabBarItem.image = .init(systemName: "rectangle.on.rectangle")
 
    createButton()
    }
    
    private func createButton() {
        view.addSubview(button)
        button.frame = CGRect(x: 100 , y: 200, width: view.bounds.width/2, height: 100)
        button.backgroundColor = .systemRed
        button.tintColor = .black
        button.titleLabel?.text = "Go to post"
        
        
        
    }
   
}

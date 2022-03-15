//
//  FeedViewController.swift
//  Navigation
//
//  Created by Олеся on 14.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var button = UIButton()
    private let post = Post(title: "Feed")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = post.title
        createButton()
    }
    
    private func createButton() {
        view.addSubview(button)
        button.frame = CGRect(x: 100 , y: 200 , width: view.bounds.width/2, height: 30)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemRed
        button.setTitle("Go to Post", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonPush(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonPush(_ sender: UIButton) {
        navigationController?.pushViewController(PostViewController(), animated: true)
    }
}

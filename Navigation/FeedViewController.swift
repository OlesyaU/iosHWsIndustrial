//
//  FeedViewController.swift
//  Navigation
//
//  Created by Олеся on 14.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let post = Post(title: "Feed")
    private var goToPostButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemRed
        button.setTitle("Go to Post", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPush(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .systemMint
        title = post.title
        navigationItem.title = post.title
        view.addSubview(goToPostButton)
    }
    
    @objc private func buttonPush(_ sender: UIButton) {
        navigationController?.pushViewController(PostViewController(), animated: true)
    }
}

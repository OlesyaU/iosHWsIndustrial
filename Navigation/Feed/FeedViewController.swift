//
//  FeedViewController.swift
//  Navigation
//
//  Created by Олеся on 14.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
//    private let post = Post(title: "Feed")
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        return stack
        
    }()
    
    
    private lazy var firstButton: CustomButton = {
        let button = CustomButton(title: "First", background: .yellow, titleColor: .black)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPush(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton: CustomButton = {
        let button = CustomButton(title: "Second", background: .black, titleColor: .yellow)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPush(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Feed"
        navigationItem.title = "Feed"
        view.addSubview(stackView)
        stackViewLayout()
    }
    
    @objc private func buttonPush(_ sender: UIButton) {
        navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    private func stackViewLayout() {
        [firstButton, secondButton].forEach{ stackView.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 110),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            firstButton.heightAnchor.constraint(equalToConstant: 50),
            secondButton.heightAnchor.constraint(equalToConstant: 50),
            firstButton.widthAnchor.constraint(equalToConstant: 200),
            secondButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

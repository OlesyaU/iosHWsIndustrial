//
//  LogInViewController.swift
//  Navigation
//
//  Created by Олеся on 01.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView =  {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .systemBlue
        scroll.isUserInteractionEnabled = true
        scroll.bounces = true
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
        
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 10
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.backgroundColor = .systemGray6
        stack.clipsToBounds = true
        stack.axis = .vertical
        return stack
        
    }()
    
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = .init(named:"logo")
        return logo
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor.init(named: "ColorHEX")
        textField.textColor = .black
        textField.placeholder = "Email or phone"
        textField.autocapitalizationType = .none
        textField.allowsEditingTextAttributes = true
//        textField.clearsOnBeginEditing = true
        textField.isUserInteractionEnabled = true
        textField.keyboardType = .default
        textField.keyboardAppearance = .default
//        textField.addTarget(self, action: #selector(textFieldEditing(_:)), for: .editingChanged)
        return textField
    } ()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "Password"
        textField.allowsEditingTextAttributes = true
        textField.isSecureTextEntry = true
        textField.clearsOnBeginEditing = true
        textField.isUserInteractionEnabled = true
        textField.keyboardType = .default
        textField.keyboardAppearance = .default
//        textField.addTarget(self, action: #selector(textFieldEditing(_:)), for: .editingChanged)
        return textField
    } ()
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named:"blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Log In", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(logInButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       navigationController?.navigationBar.isHidden = true
        layout()
    
        
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [logo,stackView, logInButton].forEach{contentView.addSubview($0)}
        [nameTextField, passwordTextField].forEach{stackView.addArrangedSubview($0)}
        
        let logoSize: CGFloat = 100
        let logoConstraint: CGFloat = 120
        let standartConstraint: CGFloat = 16
        
        NSLayoutConstraint.activate([
//             scrollView constraints
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
        //            logo constraints
            logo.heightAnchor.constraint(equalToConstant: logoSize),
            logo.widthAnchor.constraint(equalToConstant: logoSize),
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: logoConstraint),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

//    logInButton constraints
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: standartConstraint),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartConstraint),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -standartConstraint),
            logInButton.heightAnchor.constraint(equalToConstant: logoSize/2),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //           stackView constraints
            stackView.heightAnchor.constraint(equalToConstant: logoSize),
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: logoConstraint),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartConstraint),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -standartConstraint)
        
        ])
}
    @objc private func logInButtonTapped(_ sender: UIButton) {
        switch sender.state {
            case .normal:
                sender.alpha = 1
            case .selected:
                sender.alpha = 0.8
            case .highlighted:
                sender.alpha = 0.8
            case .disabled:
                sender.alpha = 0.8
            default:
                break
        }
    }
    

}

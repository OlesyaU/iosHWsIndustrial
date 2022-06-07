//
//  LogInViewController.swift
//  Navigation
//
//  Created by Олеся on 01.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView =  {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isUserInteractionEnabled = true
        scroll.bounces = true
        scroll.contentInsetAdjustmentBehavior = .scrollableAxes
        scroll.verticalScrollIndicatorInsets = .zero
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        textField.clearsOnBeginEditing = true
        textField.isUserInteractionEnabled = true
        textField.delegate = self
        textField.autocorrectionType = .no
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
        textField.isSecureTextEntry = true
        textField.clearsOnBeginEditing = true
        textField.isUserInteractionEnabled = true
        textField.delegate = self
        textField.autocorrectionType = .no
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(keyboardShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
            
            //           stackView constraints
            stackView.heightAnchor.constraint(equalToConstant: logoSize),
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: logoConstraint),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartConstraint),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -standartConstraint),
            
            //    logInButton constraints
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: standartConstraint),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: standartConstraint),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -standartConstraint),
            logInButton.heightAnchor.constraint(equalToConstant: logoSize/2),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @objc private func logInButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
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
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            print(#function)
        }
    }
    
    @objc private func keyboardHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        print(#function)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

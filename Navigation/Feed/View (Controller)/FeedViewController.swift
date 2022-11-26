//
//  FeedViewController.swift
//  Navigation
//
//  Created by Олеся on 14.03.2022.
//

import UIKit

infix operator ?=

extension String {
    static func ?= (left: String?, right: String) -> Bool {
        let word = left != nil ? left : right
        return left == word
    }
}

protocol FeedModelProtocol: AnyObject {
    func getpassword() -> String
    func check(word: String) -> Bool
}

class FeedViewController: UIViewController {
    
    private let viewModel: FeedViewModel
    private var result: Bool?
    var coordinator: FeedCoordinator
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: view.center.x - 100, y: 100, width: 200, height: 50))
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.alpha = 0.5
        return label
    }()
    
    private lazy var textField: CustomTextField = {
        let textField = CustomTextField(borderStyle: .roundedRect, clearButton: .whileEditing, color: .systemBlue)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = false
        return textField
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: view.center.x, y: view.center.y, width: 100, height: 100))
        indicator.style = .whiteLarge
        return indicator
    }()
    
    private lazy var brutForceButton: CustomButton = {
        let button = CustomButton(title: "Подобрать пароль", background: .systemYellow, titleColor: .black)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(bruteButtonPush(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton: CustomButton = {
        let button = CustomButton(title: "Check", background: .black, titleColor: .systemYellow)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPush(_:)), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: FeedViewModel, coordinator: FeedCoordinator){
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Feed"
        navigationItem.title = "Feed"
        view.addSubview(stackView)
        view.addSubview(label)
        stackViewLayout()
        viewModel.changeState(action: .viewIsReady)
        activityIndicator.isHidden = true
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        textField.text = ""
    //        label.text = ""
    //    }
    //    Я закомментировала данный код, чтобы результат проверки при возврате на этот контроллер было видно.Если надо . могу убрать просто эту проверку и оставить этот код- в таком случае при возврате на этот экран поле ввода и лейбл будут пустыми
    
    @objc private func buttonPush(_ sender: UIButton) {
        guard let word = textField.text else {return}
        
        if word ?= "" {
            viewModel.word = word
            viewModel.changeState(action: .buttonTapped)
            result = viewModel.result
            coordinator.check = { [weak self] in
                guard let result = self?.result else {return false}
                return result
            }
            
            label.text = word
            if result  == true {
                label.textColor = .systemGreen
            } else {
                label.textColor = .red
            }
        }
        textField.resignFirstResponder()
        coordinator.setUp()
    }
    
    @objc private func bruteButtonPush(_ sender: UIButton) {
        viewModel.changeState(action: .brutForce)
        let brute = viewModel.bruteForce
        let queue = OperationQueue()
        guard let word = viewModel.word else {return}
        let operation = Operation()
        queue.addBarrierBlock {
            OperationQueue.main.addOperation {[weak self] in
                self?.viewModel.changeState(action: .brutForce)
                self?.activityIndicator.isHidden = false
                self?.activityIndicator.startAnimating()
            }
            brute.bruteForce(passwordToUnlock: word)
        }
        
        operation.completionBlock = {
            OperationQueue.main.addOperation { [weak self] in
                self?.activityIndicator.isHidden = true
                self?.activityIndicator.stopAnimating()
                self?.textField.text = word
            }
        }
        queue.addOperation(operation)
    }
    
    private func stackViewLayout() {
        [textField, brutForceButton, secondButton, activityIndicator].forEach{ stackView.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 170),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            textField.heightAnchor.constraint(equalToConstant: 50),
            brutForceButton.heightAnchor.constraint(equalToConstant: 50),
            brutForceButton.widthAnchor.constraint(equalToConstant: 200),
            secondButton.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 200),
            secondButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}


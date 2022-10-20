//
//  FeedViewController.swift
//  Navigation
//
//  Created by Олеся on 14.03.2022.
//

import UIKit


protocol FeedModelProtocol: AnyObject {
    func check(word: String) -> Bool
}

class FeedViewController: UIViewController {
    
    weak var model: FeedModelProtocol?
    private var result: Bool?
    weak var coordinator: FeedCoordinator?
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.alpha = 0.5
        return label
    }()
    
    
    private lazy var textField: CustomTextField = {
        let textField = CustomTextField(borderStyle: .roundedRect, clearButton: .whileEditing, color: .systemBlue)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        return textField
    }()
    
    private lazy var secondButton: CustomButton = {
        let button = CustomButton(title: "Check", background: .black, titleColor: .yellow)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPush(_:)), for: .touchUpInside)
        return button
    }()
    
    init(model: FeedModelProtocol){
        self.model = model
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.text = ""
        label.text = ""
    }
    
    
    @objc private func buttonPush(_ sender: UIButton) {
        guard let word = textField.text else {return}
        
        let alert = UIAlertController(title: "TextField free", message: "You didn't write something. Change this please to continue", preferredStyle: .alert)
        let act = UIAlertAction(title: "Ok", style: .cancel)
        
        if word != "" {
            result =  model?.check(word: word)
            label.text = word
            print(result)
            if result == true {
                label.textColor = .systemGreen
            } else {
                label.textColor = .red
            }
        } else {
            alert.addAction(act)
            self.present(alert, animated: true)
            label.text = ""
        }
        
        textField.resignFirstResponder()

        }
    
    private func stackViewLayout() {
        [textField, secondButton].forEach{ stackView.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 110),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            textField.heightAnchor.constraint(equalToConstant: 50),
            secondButton.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 200),
            secondButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

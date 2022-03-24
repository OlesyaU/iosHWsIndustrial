//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Олеся on 22.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let const: CGFloat = 16
    private var statusText: String = ""
    
    private var statusTextFieldHeightConstraint: NSLayoutConstraint?
    private var showStatusButtonTopConstraint: NSLayoutConstraint?
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.bounds.size = CGSize(width: 100, height: 100)
        image.image = UIImage(named: "Томас")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = image.bounds.height/2
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel ()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Кот Томас"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel ()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "Тут будет статус"
        label.numberOfLines = 1
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(statusLabelTapped(_:)))
        label.addGestureRecognizer(gesture)
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "Тут я пишу статус"
        textField.allowsEditingTextAttributes = true
        textField.clearsOnBeginEditing = true
        textField.isUserInteractionEnabled = true
        textField.keyboardType = .default
        textField.keyboardAppearance = .default
        textField.addTarget(self, action: #selector(textFieldEditing(_:)), for: .editingChanged)
        return textField
    } ()
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(showStatusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(avatarImage)
        addSubview(nameLabel)
        addSubview(showStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(avatarImage)
        addSubview(nameLabel)
        addSubview(showStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: const),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: const),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: const),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -const),
            
            statusLabel.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: -27),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: const),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -const),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: const/2),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -const),
            
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: const),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -const),
            showStatusButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        //        констрейнты, которые мы будем анимировать, чтобы кнопка опускалась вниз
        showStatusButtonTopConstraint = showStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: const)
        showStatusButtonTopConstraint?.isActive = true
        
        statusTextFieldHeightConstraint = statusTextField.heightAnchor.constraint(equalToConstant: .zero)
        statusTextFieldHeightConstraint?.isActive = true
    }
    
    @objc private func showStatusButtonTapped() {
        hideStatusTextField { [unowned self] completed in
            guard completed else { return }
            self.statusLabel.text = self.statusText
        }
        statusLabel.textColor = .black
        print(" Status Text : \(statusText)")
    }
    
    private func hideStatusTextField(completion: @escaping (Bool) -> Void ) {
        layoutIfNeeded()
        statusTextFieldHeightConstraint?.constant = .zero
        showStatusButtonTopConstraint?.constant = const
        
        UIView.animate(withDuration: 0.25, animations: {
            self.layoutIfNeeded()
        },
                       completion: completion
        )
    }
    
    @objc private func textFieldEditing(_ textfield: UITextField) {
        statusText = statusTextField.text ?? "text is lost"
    }
    
    private func showStatusTextfield(){
        layoutIfNeeded()
        statusTextFieldHeightConstraint?.constant = 40
        showStatusButtonTopConstraint?.constant = 32
        UIView.animate(withDuration: 0.25, animations: {
            self.layoutIfNeeded()
        })
    }
    
    @objc private func statusLabelTapped(_ sender: UITapGestureRecognizer){
        showStatusButton.setTitle("Set status", for: .normal)
        showStatusTextfield()
        statusTextField.becomeFirstResponder()
        print("tap is work")
    }
}

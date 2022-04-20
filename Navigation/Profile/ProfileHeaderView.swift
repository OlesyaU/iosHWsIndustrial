//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Олеся on 22.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.bounds.size = CGSize(width: 100, height: 100)
        image.image = UIImage(named: "Томас")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = image.bounds.height/2
        image.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToAvatar))
        image.addGestureRecognizer(tap)
        return image
    }()
    
    private let imageAnimation: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sizeThatFits(UIScreen.main.bounds.size)
        image.backgroundColor = .white
        image.alpha = 0.8
        image.isHidden = true
        return image
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "close"), for: .normal)
        button.clipsToBounds = true
        button.alpha = 0
        button.isHidden = true
        button.addTarget(ProfileHeaderView.self, action: #selector(closeTap), for: .touchUpInside)
        return button
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
        label.translatesAutoresizingMaskIntoConstraints = false
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
        [nameLabel, showStatusButton, statusLabel, statusTextField, avatarImage, closeButton ].forEach({addSubview($0)})
        self.insertSubview(imageAnimation, at: 4)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupConstraints() {
        let constraint: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: constraint),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constraint),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: constraint),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constraint),
            
            statusLabel.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: -constraint),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constraint),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: constraint/2),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constraint),
            
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constraint),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constraint),
            showStatusButton.heightAnchor.constraint(equalToConstant: 40),
            showStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 40),
            showStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constraint),
            
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: constraint),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constraint),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc private func showStatusButtonTapped() {
        self.statusLabel.text = self.statusText
        statusLabel.textColor = .black
        statusTextField.endEditing(true)
        statusTextField.resignFirstResponder()
        statusTextField.text = nil
        print(" Status Text : \(statusText)")
    }
    
    @objc private func textFieldEditing(_ textfield: UITextField) {
        statusTextField.becomeFirstResponder()
        showStatusButton.setTitle("Set status", for: .normal)
        statusText = statusTextField.text ?? "text is lost"
    }
    
    @objc private func tapToAvatar(){
        let centerX = UIScreen.main.bounds.width / 2
        let centerY = UIScreen.main.bounds.height / 2
        UIView.animate(withDuration:0.01, delay: 0, options:.curveEaseInOut, animations: { [self] in
            self.imageAnimation.isHidden = false
            self.imageAnimation.frame.size = UIScreen.main.bounds.size
            self.layoutIfNeeded()
        }, completion: {_ in
            UIView.animate(withDuration: 0.5, animations: {
                self.avatarImage.center.x = centerX
                self.avatarImage.center.y = centerY
                self.avatarImage.layer.cornerRadius = 0
                self.avatarImage.transform = CGAffineTransform(scaleX: 4, y: 4)
                self.layoutIfNeeded()
            }, completion: {_ in
                UIView.animate(withDuration: 0.3, delay: 0.5, animations: {
                    self.closeButton.alpha = 0.9
                    self.closeButton.isHidden = false
                    self.layoutIfNeeded()
                })
            })
        })
    }
   
    @objc private func closeTap(){
        imageAnimation.isHidden = true
        closeButton.isHidden = true
        
        
//        UIView.animate(withDuration: 0.5) { [self] in
//            self.imageAnimation.isHidden = true
//            self.closeButton.isHidden = true
//        } completion: { [self] _ in
////            self.avatarImage.layer.cornerRadius = 50
//        }

    }
}

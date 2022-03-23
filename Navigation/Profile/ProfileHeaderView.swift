//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Олеся on 22.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    private let const: CGFloat = 16
    private var buttonY : CGFloat = 0.0
  
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
    
    private let statusLabel: UILabel = {
        let label = UILabel ()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "Тут будет статус"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
      
        return label
    }()
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.alpha = 0.5
        textField.backgroundColor = .white
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "Тут я пишу статус"
        return textField
    } ()
    
    private let showStatusButton: UIButton = {
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
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(avatarImage)
        addSubview(nameLabel)
        addSubview(showStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
        setupConstraints()
        buttonY = checkButtonOrigin()
      }
    
    @objc private func buttonPressed() {

        showStatusButton.setTitle("Set status", for: .normal)
        statusTextField.alpha = 1
        animateButton()
        print(statusLabel.text!)
    }
   
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: const),
            showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -const),
            showStatusButton.heightAnchor.constraint(equalToConstant: 40),
            showStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: const),
            
            avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: const),
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: const),
            avatarImage.widthAnchor.constraint(equalToConstant:100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: const),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -const),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: const),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -const),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: const/2),
            statusTextField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: const),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: showStatusButton.trailingAnchor)
            ])
    }
    
    private func checkButtonOrigin() -> CGFloat{
//        тут мы просто находим какой игрек был изначально, чтобы потом его увеличить на размер полей и констрейнт, чтобы было как в макете , а вообще можно обойтись без
//        let buttonFrame = showStatusButton.accessibilityFrame
//        let y = buttonFrame.origin.y, но я оставлю чтоб было понятно откуда я всё взяла.Ну и принт можно убрать) потом
        
        let buttonFrame = showStatusButton.accessibilityFrame
        let y = buttonFrame.origin.y
        buttonY = showStatusButton.frame.origin.y
        print(buttonFrame, y, buttonY)
        return y
        }
    private func animateButton() {
        let statusTextHeight = statusTextField.bounds.height
        let showButtonHeight = showStatusButton.bounds.height
        let newY = buttonY + statusTextHeight + showButtonHeight + const
        showStatusButton.frame.origin = CGPoint(x: const, y: newY)
 }
    
}

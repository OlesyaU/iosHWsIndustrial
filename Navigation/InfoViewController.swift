//
//  InfoViewController.swift
//  Navigation
//
//  Created by Олеся on 15.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        createButton()
    }
    
    private func createButton(){
        button.frame = CGRect(origin: CGPoint(x: 100, y: 150), size: CGSize(width: 150, height: 30))
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitle("Push on me", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTap(_sender:)), for: .touchUpInside)
    }
    
    @objc private func buttonTap(_sender: UIButton) {
        let alert = UIAlertController(title: "OOPS", message: "Something wrong!Run!", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "I understand", style: .default, handler:  {
            _ in print("I understand")
        }))
        
        alert.addAction(UIAlertAction(title: "I need more info", style: .default, handler: {  _ in print("I need more info")
        }))
        
        self.present(alert, animated: true, completion: nil)
        print("Info button tapped")
    }
    
}

//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Олеся on 14.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        view.addSubview(profileHeaderView)
    }
    override func viewWillLayoutSubviews() {
//        profileHeaderView.frame = view.frame/
        profileHeaderView.frame = self.view.safeAreaLayoutGuide.layoutFrame
       
    }
}

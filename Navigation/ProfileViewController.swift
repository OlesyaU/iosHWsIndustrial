//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Олеся on 14.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
view.backgroundColor = .yellow
        navigationController?.title = "Profile"
        navigationItem.title = "Profile"
        navigationController?.tabBarItem.image = .init(systemName: "person")


        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

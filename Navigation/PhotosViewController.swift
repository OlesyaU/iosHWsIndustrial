//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Олеся on 16.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var collection: UICollectionView =  {
        let collection = UICollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
      
    }
    


}

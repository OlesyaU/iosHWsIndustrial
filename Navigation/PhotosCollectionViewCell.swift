//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Олеся on 16.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    private let photos = Photo.photos()
    
    
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        for i in photos {
            image.image = i.photo
        }
//        photos.forEach({image.image = $0.photo})
        
        
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func layout() {
        contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        
        
        ])
    }
}

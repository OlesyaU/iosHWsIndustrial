//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Олеся on 16.04.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    private let photos = Photo.getPhotos()
    private let constraint: CGFloat = 8
    
    private lazy var collection: UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        title = "Photo Gallery"
        navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
        layout()
        imagePublisherFacade.subscribe(self)
        receive(images: photos)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        imagePublisherFacade.rechargeImageLibrary()
        imagePublisherFacade.removeSubscription(for: self)
    }
    
    private func layout(){
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
// MARK: - UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        let photo = photos[indexPath.item]
        cell.configure(photo: photo)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - constraint * 4)/3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: constraint, left: constraint, bottom: constraint, right: constraint)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        constraint
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        constraint
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    
    private var imagePublisherFacade: ImagePublisherFacade {
        let publisher = ImagePublisherFacade()
        return publisher
    }
    
    func receive(images: [UIImage]) {
        imagePublisherFacade.addImagesWithTimer(time: .infinity, repeat: 10, userImages: images)
        print(#function)
    }
}

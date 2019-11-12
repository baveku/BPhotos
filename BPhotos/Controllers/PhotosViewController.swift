//
//  ViewController.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    let presenter = PhotosPresenter()
    
    var imagesURL: [String] = []
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter.delegate = self
        self.photosCollectionView.delegate = self
        self.photosCollectionView.dataSource = self
        self.presenter.loadImages()
    }
    
    func pushToViewImageDetail() {
        
    }
}

// MARK: PresenterDelegate
extension PhotosViewController: PhotosViewDelegate {
    func loadAllFileFromImageDirectory(images: [String]) {
        self.imagesURL = images
    }
}

// MARK: UICollectionViewDelegate
extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.ID, for: indexPath) as! ImageCollectionViewCell
        cell.configure(imageURL: self.imagesURL[indexPath.item])
        return cell
    }
}

// MARK: UICollectionFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 3, height: collectionView.bounds.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension PhotosViewController: UIViewControllerTransitioningDelegate  {
//    func animationController(forPresented presented: UIViewController,
//                              presenting: UIViewController,
//                              source: UIViewController)
//       -> UIViewControllerAnimatedTransitioning? {
//       return ScaleTransitionAnimationController(originFrame: cardView.frame)
//     }
}


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
    var listImagePath: [String] = []
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter.delegate = self
        self.photosCollectionView.delegate = self
        self.photosCollectionView.dataSource = self
        self.presenter.loadImages()
    }
    
    func pushToViewImageDetail(imagePath: String) {
        self.performSegue(withIdentifier: EMainSegue.fromPhotosToImageDetail.rawValue, sender: imagePath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        if identifier == EMainSegue.fromPhotosToImageDetail.rawValue {
            let destinationVC = segue.destination as! ImageDetailViewController
            destinationVC.imagePath = sender as! String
        }
    }
}

// MARK: PresenterDelegate
extension PhotosViewController: PhotosViewDelegate {
    func loadAllFileFromImageDirectory(images: [String]) {
        self.listImagePath = images
        self.titleTextField.text = "\(images.count) Images"
        self.photosCollectionView.reloadData()
    }
}

// MARK: UICollectionViewDelegate
extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.pushToViewImageDetail(imagePath: self.listImagePath[indexPath.item])
    }
}

// MARK: UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listImagePath.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.ID, for: indexPath) as! ImageCollectionViewCell
        cell.configure(imagePath: self.listImagePath[indexPath.item])
        return cell
    }
}

// MARK: UICollectionFlowLayout
// Collection Config:
//    - 4 Item / Row

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


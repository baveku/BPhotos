//
//  ImageCollectionViewCell.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let ID = "IMAGE_CELL"
    
    override var reuseIdentifier: String? {
        return ImageCollectionViewCell.ID
    }
    
    func configure(imageURL: String) {
        DispatchQueue.global(qos: .userInteractive).async {
            let image = UIImage.init(named: imageURL)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
}

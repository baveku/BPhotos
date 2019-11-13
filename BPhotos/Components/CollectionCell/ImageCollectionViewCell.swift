//
//  ImageCollectionViewCell.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {
    static let ID = "IMAGE_CELL"
    
    override var reuseIdentifier: String? {
        return ImageCollectionViewCell.ID
    }
    
    // MARK: Configure Cell
    func configure(imagePath: String) {
        let resizeProcessor = ResizingImageProcessor(referenceSize: CGSize(width: 200, height: 200), mode: .aspectFill)
        let url = URL.init(fileURLWithPath: imagePath)
        self.imageView.kf.setImage(with: url, options: [.processor(resizeProcessor)])
    }
    
    @IBOutlet weak var imageView: UIImageView!
}

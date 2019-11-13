//
//  PhotosViewModel.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import UIKit
import Kingfisher
protocol PhotosViewDelegate {
    func loadAllFileFromImageDirectory(images: [String])
}
class PhotosPresenter {
    var delegate: PhotosViewDelegate?
    private var imagePaths: [String]
    
    init() {
        // Initializer
        self.imagePaths = []
    }
    
    func loadImages() {
        self.imagePaths = FileHelpers.loadAllFile(with: .jpg, in: .nature)
        self.delegate?.loadAllFileFromImageDirectory(images: self.imagePaths)
    }
}

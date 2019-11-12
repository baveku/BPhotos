//
//  PhotosViewModel.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import UIKit
protocol PhotosViewDelegate {
    func loadAllFileFromImageDirectory(images: [String])
}
class PhotosPresenter {
    var delegate: PhotosViewDelegate?
    private var imageURLs: [String]
    
    init() {
        // Initializer
        imageURLs = []
    }
    
    func loadImages() {
        self.imageURLs = FileHelpers.loadAllFile(with: .jpg, in: .nature)
        self.delegate?.loadAllFileFromImageDirectory(images: imageURLs)
    }
}

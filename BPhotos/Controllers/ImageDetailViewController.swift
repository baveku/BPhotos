//
//  ImageDetailViewController.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import UIKit
import Kingfisher


class ImageDetailViewController: UIViewController {
    var imagePath: String = ""
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL.init(fileURLWithPath: self.imagePath)
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: url)
    }
    
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
}



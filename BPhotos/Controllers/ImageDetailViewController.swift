//
//  ImageDetailViewController.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    var imageURL: String = ""
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = UIImage(named: self.imageURL)
    }
    @IBAction func onClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
}



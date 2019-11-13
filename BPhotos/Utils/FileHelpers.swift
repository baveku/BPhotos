//
//  FileHelpers.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import UIKit
import Foundation

enum EFileType: String {
    case jpg = "jpg"
    case none
}

enum EDirectory: String {
    case nature = "nature"
    case none
}


class FileHelpers {
    class func loadAllFile(with fileType: EFileType?, in directory: EDirectory = EDirectory.none) -> [String] {
        return Bundle.main.paths(forResourcesOfType: fileType?.rawValue, inDirectory: directory.rawValue)
    }
    
//    class func getLocalFileFromName(name: String, in directory: EDirectory = EDirectory.none) -> Bundle {
//        return Bundle.main.paths(forResourcesOfType: name, inDirectory: directory)
//    }
}

//
//  FileHelpers.swift
//  BPhotos
//
//  Created by Bách veku on 11/12/19.
//  Copyright © 2019 Bách veku. All rights reserved.
//

import Foundation

enum EFileType {
    case mp3
    case mp4
    case jpg
    case none
    
    func toString() -> String? {
        switch self {
        case .mp3:
            return "mp3"
        case .mp4:
            return "mp4"
        case .jpg:
            return "jpg"
        default:
            return nil
        }
    }
}

enum EDirectory {
    case img
    case mp4
    case txt
    case nature
    case none
    
    func toString() -> String? {
        switch self {
        case .img:
            return "img"
        case .mp4:
            return "mp4"
        case .txt:
            return "txt"
        case .nature:
            return "nature"
        default:
            return nil
        }
    }
}


class FileHelpers {
    class func loadAllFile(with fileType: EFileType?, in directory: EDirectory = EDirectory.none) -> [String] {
        return Bundle.main.paths(forResourcesOfType: fileType?.toString(), inDirectory: directory.toString())
    }
    
//    class func getLocalFileFromName(name: String, in directory: EDirectory = EDirectory.none) -> Bundle {
//        return Bundle.main.paths(forResourcesOfType: name, inDirectory: directory)
//    }
}

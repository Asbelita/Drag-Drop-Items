//
//  Image.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/5/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class Image : Codable{
    var name: String?
    var id: Int?
    var url: String?
    
    init(id: Int?, name: String?, url: String?) {
        self.id = id
        self.name = name
        self.url = url
    }
}

class ImageViewModel : Image {
    var image: UIImage?
}

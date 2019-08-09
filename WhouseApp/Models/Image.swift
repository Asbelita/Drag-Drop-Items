//
//  Image.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/5/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class Image{
    var name: String?
    var id: Int?
    var url: String?
    var image: UIImage?
    
    init(id: Int?, name: String?, url: String?, image: UIImage?) {
        self.id = id
        self.name = name
        self.url = url
        self.image = image
    }
}

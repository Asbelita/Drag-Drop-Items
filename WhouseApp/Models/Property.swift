//
//  Property.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/6/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class Property{
    var name: String?
    var id: Int?
    weak var image: UIImage?
    var address: String?
    
    init(id: Int?, name: String?, image: UIImage?, address: String?) {
        self.id = id
        self.name = name
        self.image = image
        self.address = address
    }
}

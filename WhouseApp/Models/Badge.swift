//
//  Badge.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/9/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import Foundation

class Badge {
    var id: Int
    var name: String
    var description: String
    var image: Image
    
    internal init(id: Int, name: String, description: String, image: Image) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
    }
}

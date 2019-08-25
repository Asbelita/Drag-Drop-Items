//
//  Badge.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/9/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import Foundation

class Badge : Codable{
    var id: Int
    var name: String
    var description: String
    
    internal init(id: Int, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
    }
}

class BadgeViewModel : Badge {
    var image: ImageViewModel?
}

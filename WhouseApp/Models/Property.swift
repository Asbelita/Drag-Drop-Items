//
//  Property.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/6/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class Property : Codable{
    
    var name: String?
    var id: Int?
    var address: String?
    var ownerName: String?
    var ownerPhone: String?
    var ownerEmail: String?
    var notes: String?
    var type: String?
    var bedsAmount: String?
    var bedroomsAmount: String?
    var bathroomsAmount: String?
    var area: String?
    var isAirnbnb: Bool
    var isBooking: Bool
    
    internal init(name: String?, id: Int?, address: String?, ownerName: String?, ownerPhone: String?, ownerEmail: String?, notes: String?, type: String?, bedsAmount: String?, bedroomsAmount: String?, bathroomsAmount: String?, area: String?, isAirnbnb: Bool, isBooking: Bool) {
        self.name = name
        self.id = id
        self.address = address
        self.ownerName = ownerName
        self.ownerPhone = ownerPhone
        self.ownerEmail = ownerEmail
        self.notes = notes
        self.type = type
        self.bedsAmount = bedsAmount
        self.bedroomsAmount = bedroomsAmount
        self.bathroomsAmount = bathroomsAmount
        self.area = area
        self.isAirnbnb = isAirnbnb
        self.isBooking = isBooking
    }
}

class PropertyViewModel : Property{
    var image: UIImage?
    var thumbnail: UIImage?
    var images = [ImageViewModel?]()
}

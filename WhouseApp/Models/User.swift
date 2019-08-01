//
//  User.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/1/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class User {
    
    var name: String
    var profilePicture: UIImage
    var rating: Int
    var reviewsAmount: Int
    var isVerified: Bool
    var maxResponseTime: Int
    var jobsAmount: Int
    var clientsAmount: Int
    var distance: Double
    var earned: Double
    var isSuggested: Bool
 
    init(name: String, profilePicture: UIImage, rating: Int, reviewsAmount: Int, isVerified: Bool, maxResponseTime: Int, jobsAmount: Int, clientsAmount: Int, distance: Double, earned: Double, isSuggested: Bool) {
        self.name = name
        self.profilePicture = profilePicture
        self.rating = rating
        self.reviewsAmount = reviewsAmount
        self.isVerified = isVerified
        self.maxResponseTime = maxResponseTime
        self.jobsAmount = jobsAmount
        self.clientsAmount = clientsAmount
        self.distance = distance
        self.earned = earned
        self.isSuggested = isSuggested
    }
}

//
//  Login.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/22/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import Foundation

struct Login : Codable{
    var email: String
    var password: String
    
    var dictionaryRepresentation: [String: String] {
        return [
            "email" : email,
            "password" : password,
        ]
    }
}
struct LoginResponse {
    var token: String
    var user: AuthUser
    
    init(fromDictionary dictionary: Serialization){
        self.token = dictionary.stringForKey("token")
        self.user = AuthUser.init(fromDictionary: dictionary.dictionaryForKey("user"))
    }
}

class AuthUser {
    var id : Int?
    var email : String?
    var name : String?
    var lastName : String?
    var birthdate : String?
    var celphone : String?
    var phone : String?
    var urlAvatar : String?
    var verified : Bool?
    var emailVerifiedAt : String?
    var createdAt : String?
    var updatedAt : String?
    var idRol : Int?
    
    init(fromDictionary dictionary: Serialization){
        self.id = dictionary.intForKey("id")
        self.email = dictionary.stringForKey("email")
        self.name = dictionary.stringForKey("name")
        self.lastName = dictionary.stringForKey("last_name")
        self.birthdate = dictionary.stringForKey("birthdate")
        self.celphone = dictionary.stringForKey("celphone")
        self.phone = dictionary.stringForKey("phone")
        self.urlAvatar = dictionary.stringForKey("url_avatar")
        self.verified = dictionary.boolForKey("verified")
        self.emailVerifiedAt = dictionary.stringForKey("email_verified_at")
        self.createdAt = dictionary.stringForKey("created_at")
        self.updatedAt = dictionary.stringForKey("updated_at")
        self.idRol = dictionary.intForKey("id_rol")
    }
}

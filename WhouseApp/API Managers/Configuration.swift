//
//  Configuration.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/22/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import Foundation

class Configuration {
    
    class func getScheme() -> String {
        return "http"
    }
    class func getHost() -> String {
        return "apiwhouseapp.nelumbo.com.co"
    }
    
    class func getBaseURL() -> String {
        return "/api"
    }
}


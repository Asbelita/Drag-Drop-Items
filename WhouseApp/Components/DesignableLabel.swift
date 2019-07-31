//
//  DesignableLabel.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/31/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableLabel: UILabel {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
}

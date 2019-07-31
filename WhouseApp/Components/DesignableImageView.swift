//
//  DesignableImageView.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/30/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}

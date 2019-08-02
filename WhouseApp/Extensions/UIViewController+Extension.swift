//
//  UIViewController+Extension.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/19/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func setTitle(_ title: String, andImage image: UIImage) -> UIView{
        // Create a navView to add to the navigation bar
        let height = (navigationController?.navigationBar.frame.height ?? 44) * 0.9
        let navView = UIView()
        
        // Create the label
        let label = UILabel()
        label.text = title
        label.sizeToFit()
        label.center = navView.center
        label.center.x = navView.center.x + CGFloat(height/2)
        label.textAlignment = NSTextAlignment.center
        
        // Create the image view
        let imageView = UIImageView()
        imageView.image = image
        
        // Setting the image frame so that it's immediately before the text:
        let x = label.frame.origin.x - CGFloat(height + 5)
        let y = label.frame.origin.y - label.frame.size.height * 0.5
        let width = height
        
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        
        // Add both the label and image view to the navView
        navView.addSubview(label)
        navView.addSubview(imageView)
        
        return navView
    }
}

//
//  ScrimView.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/22/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class ScrimView: UIView {
    
    fileprivate var spinner : UIActivityIndicatorView
    fileprivate var loadingLabel : UILabel
    
    override init(frame: CGRect) {
        loadingLabel = UILabel()
        spinner = UIActivityIndicatorView(style: .gray)
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        loadingLabel = UILabel()
        spinner = UIActivityIndicatorView(style: .gray)
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Public
    
    func presentInView(_ parentView : UIView) {
        parentView.addSubview(self)
        frame = parentView.bounds
        alpha = 1.0
    }
    
    func dismissFromSuperview() {
        super.removeFromSuperview()
    }
    
    func dismissAnimated(_ animationBlock : (() -> Void)?) {
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.alpha = 0.0
            if let animation = animationBlock {
                animation()
            }
            }, completion: { [weak self] finished in
                self?.removeFromSuperview()
        })
    }
    
    // MARK: - Private
    
    fileprivate func setupView() {
        frame = UIScreen.main.bounds
        
        backgroundColor = UIColor.white
        
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        loadingLabel.text = "Loading"
        loadingLabel.font = UIFont.systemFont(ofSize: 14)
        loadingLabel.textColor = UIColor.darkGray
        loadingLabel.textAlignment = .center
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loadingLabel)
        
        // Constraints
        
        // Loading Label
        NSLayoutConstraint.activate([
            loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25)
            ])
        
        // Spiner
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}

//
//  AlertView.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/22/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class AlertView: UIView {
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var actionBtn: DesignableUIButton!
    
    static let instance = AlertView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        img.layer.cornerRadius = 40
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 2
        
        alertView.layer.cornerRadius = 10
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    enum AlertType {
        case success
        case failure
    }
    
    func showAlert(title: String, message: String, alertType: AlertType, view: UIView) {
        self.titleLabel.text = title
        self.messageLabel.text = message
        self.parentView.alpha = 0
        switch alertType {
        case .success:
            img.image = UIImage(named: "success")
            actionBtn.normalBackgroundColor = UIColor.appColor(.successColor)
            actionBtn.setTitle("Ok", for: .normal)
            topBar.layer.backgroundColor = UIColor.appColor(.successColor).cgColor
        case .failure:
            img.image = UIImage(named: "error")
            actionBtn.normalBackgroundColor = UIColor.appColor(.errorColor)
            actionBtn.setTitle("Ok", for: .normal)
            topBar.layer.backgroundColor = UIColor.appColor(.errorColor).cgColor
        }
        
        UIApplication.shared.keyWindow?.addSubview(self.parentView)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.parentView.alpha = 1
        }, completion: nil)
    }
    
    @IBAction func onClickDone(_ sender: Any) {
        parentView.removeFromSuperview()
    }
}

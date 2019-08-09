//
//  PasswordRecoveryViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/19/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PasswordRecoveryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func onSendEmail(_ sender: Any) {
        AlertView.instance.actionBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        let alert = AlertView.Alert(
            title: "Success",
            message: "We have sent an email with instructions to recover your password",
            icon: UIImage.appImage(.success),
            btnCaption: "Ok",
            primaryBgColor: UIColor.appColor(.successColor),
            secundaryBgColor: UIColor.appColor(.successColorHighlighted)
        )
        AlertView.instance.showAlert(alert: alert)
    }
    
    @objc func btnAction(sender: DesignableUIButton!){
        self.dismiss(animated: true, completion: nil)
    }
}

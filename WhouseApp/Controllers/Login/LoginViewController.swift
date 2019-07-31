//
//  LoginViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/18/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func signIn(_ sender: UIButton) {
        self.loadHomeScreen()
    }
    
    @IBAction func passwordRecoveryUnwind(unwindSegue: UIStoryboardSegue){}
    
    @IBAction func registerUnwind(unwindSegue: UIStoryboardSegue){}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func loadHomeScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Navigation", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "navigationRoot") as! UITabBarController
        self.present(homeVC, animated: true, completion: nil)
    }
}

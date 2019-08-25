//
//  LoginViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/18/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {

    var apiClient : APIServiceProtocol = APIManager.sharedInstance

    @IBOutlet weak var usernameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func signIn(_ sender: UIButton) {
        let loginModel = Login(email: usernameTextField.text!, password: passwordTextField.text!)
        self.login(model: loginModel)
    }
    
    @IBAction func passwordRecoveryUnwind(unwindSegue: UIStoryboardSegue){}
    @IBAction func registerUnwind(unwindSegue: UIStoryboardSegue){}
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return super.textFieldShouldReturn(textField)
    }
    
    //Mark: Call Services
    fileprivate func login(model: Login){
        let success : APICompletionHandler = { [weak self] data in
            self?.hideScrimView()
            if let methods = data as? [Any] {
                self?.handleLoginResponse(methods)
            }
        }
        
        let failure : APIFailureHandler = { [weak self] error in
            self?.hideScrimView()
            self?.handleLoginFailure()
        }
        
        showScrimView()
        apiClient.login(success, failureHandler: failure, parameters: model.dictionaryRepresentation)
    }
    
    fileprivate func handleLoginResponse(_ response : [Any]) {
        for item in response {
            let loginResponse : LoginResponse = LoginResponse(fromDictionary: item as! Serialization)
            UserDefaults.standard.set(loginResponse.token, forKey: "loginResponse")
            UserDefaults.standard.synchronize()
            self.loadHomeScreen()
        }
    }
    
    fileprivate func handleLoginFailure(){
        self.showAlertError(title: "Oops!", message: "Wrong credentials, please try again", btnCaption: "Ok", action: #selector(btnAction))
    }

    fileprivate func loadHomeScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Navigation", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "navigationRoot") as! UITabBarController
        self.present(homeVC, animated: true, completion: nil)
    }
    
    @objc func btnAction(sender: DesignableUIButton!){
        self.passwordTextField.text = ""
        self.usernameTextField.becomeFirstResponder()
    }
}

//
//  BaseViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/22/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var scrimView : ScrimView = ScrimView()
    enum AlertTypes {
        case success
        case error
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        scrimView.frame = view.bounds
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func showScrimView() {
        scrimView.presentInView(self.view)
    }
    
    func hideScrimView() {
        scrimView.dismissFromSuperview()
    }
    
    func hideScrimViewWithAnimations(_ animationBlock : @escaping () -> Void) {
        scrimView.dismissAnimated(animationBlock)
    }
    
    func showAlertError(title: String, message: String, btnCaption: String, action: Selector?){
        self.showAlert(type: .error, title: title, message: message, btnCaption: btnCaption, action: action)
    }
    
    func showAlertSuccess(title: String, message: String, btnCaption: String, action: Selector? ){
        self.showAlert(type: .success, title: title, message: message, btnCaption: btnCaption, action: action)
    }
    
    func showAlert(type: AlertTypes, title: String, message: String, btnCaption: String, action: Selector? ){
        let icon: UIImage
        let primaryBgColor: UIColor
        let secundaryBgColor: UIColor
        switch type {
        case .success:
            icon = UIImage.appImage(.success)
            primaryBgColor = UIColor.appColor(.successColor)
            secundaryBgColor = UIColor.appColor(.successColorHighlighted)
        case .error:
            icon = UIImage.appImage(.error)
            primaryBgColor = UIColor.appColor(.errorColor)
            secundaryBgColor = UIColor.appColor(.errorColorHighlighted)
        }
        let alert = AlertView.Alert(
            title: title,
            message: message,
            icon: icon,
            btnCaption: btnCaption,
            primaryBgColor: primaryBgColor,
            secundaryBgColor: secundaryBgColor
        )
        if action != nil {
            AlertView.instance.actionBtn.addTarget(self, action: action!, for: .touchUpInside)
        }
        AlertView.instance.showAlert(alert: alert)
    }
    
    func getDefaultFailureHandler(_ title : String, message : String, btnCaption: String) -> APIFailureHandler {
        return { [weak self] error in
            self?.hideScrimView()
            self?.showAlertError(title: title, message: message, btnCaption: btnCaption, action: nil)
        }
    }

}

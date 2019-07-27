//
//  RegistrationViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/25/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit
import UICircularProgressRing

class RegistrationViewController: UIViewController {
    
    weak var pvc : UIPageViewController!
    var currentIndex = 0
    var progressPercentage = 0.0

    @IBOutlet weak var progressRing: UICircularProgressRing!
    
    private lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "step1"),
            self.getViewController(withIdentifier: "step2"),
            self.getViewController(withIdentifier: "step3"),
            self.getViewController(withIdentifier: "step4"),
            self.getViewController(withIdentifier: "step5")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        self.pvc = self.children[0] as? UIPageViewController
        self.progressPercentage = Double(100 / (self.pages.count - 1))
        
        if let firstVC = pages.first
        {
            pvc.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    @IBAction func goNextPage(_:AnyObject){
        guard self.currentIndex + 1 < pages.count else { return }
        self.currentIndex += 1
        self.pvc.setViewControllers([self.pages[self.currentIndex]], direction: .forward, animated: true, completion: nil)
        progressRing.startProgress(to: CGFloat(self.progressPercentage * Double(self.currentIndex)), duration: 0.5)
    }

    @IBAction func goPrevPage(_:AnyObject){
        guard self.currentIndex > 0 else { return }
        self.currentIndex -= 1
        self.pvc.setViewControllers([self.pages[self.currentIndex]], direction: .reverse, animated: true, completion: nil)
        progressRing.startProgress(to: CGFloat(self.progressPercentage * Double(self.currentIndex)), duration: 0.5)
    }

}

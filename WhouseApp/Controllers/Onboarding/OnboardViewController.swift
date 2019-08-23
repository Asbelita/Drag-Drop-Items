//
//  OnboardViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/26/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class OnboardViewController: BaseViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    weak var pvc : UIPageViewController!
    var currentIndex: Int?
    private var pendingIndex: Int?
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    
    private lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: "slide1"),
            self.getViewController(withIdentifier: "slide2"),
            self.getViewController(withIdentifier: "slide3"),
            self.getViewController(withIdentifier: "slide4")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pvc = self.children[0] as? UIPageViewController
        self.pvc.dataSource = self
        self.pvc.delegate = self
        if let firstVC = pages.first
        {
            pvc.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        self.configurePageControl()
    }
    
    
    func configurePageControl(){
        self.pageControl.numberOfPages = pages.count
        self.pageControl.currentPage = 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = self.pages.firstIndex(of: viewController)!
        if currentIndex == 0 {
            return nil
        }
        let previousIndex = currentIndex - 1
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = self.pages.firstIndex(of: viewController)!
        if currentIndex == pages.count-1 {
            return nil
        }
        let nextIndex = currentIndex + 1
        return pages[nextIndex]
    }
    
    private func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = pages.firstIndex(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageControl.currentPage = index
            }
        }
    }
    
    @IBAction func goToLast(_ sender: UIButton) {
        currentIndex = pages.count - 1
        self.pvc.setViewControllers([pages.last!], direction: .forward, animated: true, completion: nil)
        pageControl.currentPage = currentIndex!
    }

}

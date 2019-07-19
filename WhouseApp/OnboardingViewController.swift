//
//  ViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/17/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit


class OnboardingViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "logoWithName")
        slide1.labelDesc.text = "Class aptent taciti sociosqu ad litora torquent per conubia nostra"
        slide1.continueButton.isHidden = true
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "logoWithName")
        slide2.labelDesc.text = "Proin nisi mi, accumsan nec posuere et, aliquam ultricies neque. Vestibulum et sem ac ante mollis auctor scelerisque at nibh."
        slide2.continueButton.isHidden = true
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "logoWithName")
        slide3.labelDesc.text = "Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
        slide3.continueButton.isHidden = false
        slide3.continueButton.setTitle("Continuar", for: .normal)
        slide3.continueButton.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        return [slide1, slide2, slide3]
    }
    
    @objc func btnAction(sender: DesignableUIButton!){
        let storyBoard : UIStoryboard = self.storyboard!
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        present(nextViewController, animated:true, completion:nil)
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    /*
     * default function called when view is scolled. In order to enable callback
     * when scrollview is scrolled, the below code needs to be called:
     * slideScrollView.delegate = self or
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        scrollView.contentOffset.y = 0
    }
}


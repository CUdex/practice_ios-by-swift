//
//  ViewController.swift
//  OnBoardingPracticeApp
//
//  Created by cudex on 2022/04/03.
//

import UIKit

class ViewController: UIViewController {
    
    let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
    
    var didShowOnBoardingView = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if didShowOnBoardingView == false {
            didShowOnBoardingView = true
            pageVC.modalPresentationStyle = .fullScreen
            self.present(pageVC, animated: true, completion: nil)
        }
    }

    @IBAction func goToPage(_ sender: Any) {
        self.present(pageVC, animated: true, completion: nil)
    }
    
}


//
//  OnBoardingItemViewController.swift
//  OnBoardingPracticeApp
//
//  Created by cudex on 2022/04/03.
//

import UIKit

class OnBoardingItemViewController: UIViewController {
    
    var mainText = ""
    var subText = ""
    var topImg: UIImage? = UIImage()

    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var mainTitleLable: UILabel! {
        didSet {
            mainTitleLable.font = .systemFont(ofSize: 40, weight: .medium)
        }
    }
    @IBOutlet private weak var subdescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLable.text = mainText
        topImageView.image = topImg
        // Do any additional setup after loading the view.
    }
}

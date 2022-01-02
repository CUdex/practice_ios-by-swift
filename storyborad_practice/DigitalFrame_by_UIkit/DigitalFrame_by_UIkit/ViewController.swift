//
//  ViewController.swift
//  DigitalFrame_by_UIkit
//
//  Created by 류찬울 on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toggleButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        var cuteImages = [UIImage]()
        for i in 1...15 {
            cuteImages += [UIImage(named: "\(i).jpg")!]
        }
//        let cuteImages = [UIImage(named: "1.jpg")!,
//                          UIImage(named: "2.jpg")!,
//                          UIImage(named: "3.jpg")!,
//                          UIImage(named: "4.jpg")!,
//                          UIImage(named: "5.jpg")!,
//                          UIImage(named: "6.jpg")!,
//                          UIImage(named: "7.jpg")!,
//                          UIImage(named: "8.jpg")!,
//                          UIImage(named: "9.jpg")!,
//                          UIImage(named: "10.jpg")!,
//                          UIImage(named: "11.jpg")!,
//                          UIImage(named: "12.jpg")!,
//                          UIImage(named: "13.jpg")!,
//                          UIImage(named: "14.jpg")!,
//                          UIImage(named: "15.jpg")!]
        
        
        imageView.animationImages = cuteImages
        imageView.animationDuration = 15.0
 
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toggleButton(_ sender:Any){
        if !imageView.isAnimating {
            imageView.startAnimating()
            toggleButton.setTitle("stop", for: UIControl.State.normal)
        } else {
            imageView.stopAnimating()
            toggleButton.setTitle("start", for: UIControl.State.normal)
        }
    }


}


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
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedLable: UILabel!

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
        speedLable.text = String(format: "%.2f", speedSlider.value)
 
        // Do any additional setup after loading the view.
    }
    
    @IBAction func speedSliderAction(_ sender: Any) {
        //slider의 경우 주기적으로 이벤트 발생
        imageView.animationDuration = Double(speedSlider.value)
        imageView.startAnimating()
        //stop으로 버튼 상태 변경
        toggleButton.setTitle("stop", for: UIControl.State.normal)
        //label에 속도 출력
        speedLable.text = String(format: "%.2f", speedSlider.value)
    }
    
    
    @IBAction func toggleButton(_ sender:Any){
        if !imageView.isAnimating {
            imageView.startAnimating()
            toggleButton.setTitle("stop", for: UIControl.State.normal)
        } else {
            imageView.animationDuration = Double(speedSlider.value)
            imageView.stopAnimating()
            toggleButton.setTitle("start", for: UIControl.State.normal)
        }
    }


}


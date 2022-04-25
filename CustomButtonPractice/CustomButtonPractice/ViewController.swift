//
//  ViewController.swift
//  CustomButtonPractice
//
//  Created by cudex on 2022/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myCustomButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let myButton = CustomButton()
//        self.view.addSubview(myButton)
//
//        // auto layout setting
//        // myButton auto layout으로 설정
//        myButton.translatesAutoresizingMaskIntoConstraints = false
//        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
//        //myButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        myButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        myButton.backgroundColor = UIColor.orange
//        myButton.setTitle("my custom button", for: .normal)
//        myButton.setImage(UIImage(systemName: "arrowtriangle.down"), for: .normal)
//
//        // frame 세팅으로 버튼 생성
//        let myButton2 = CustomButton()
//        self.view.addSubview(myButton2)
//
//        myButton2.translatesAutoresizingMaskIntoConstraints = true
//        myButton2.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
//        myButton2.backgroundColor = UIColor.brown
//        myButton2.setTitle("my custom button2", for: .normal)
//        myButton2.setImage(UIImage(systemName: "arrowtriangle.down"), for: .normal)
        
        myCustomButton.selectTypeCallback = { upDownType in
            print(upDownType)
        }
        
        
        
    }


}


//
//  thirdViewController.swift
//  tabbarEx
//
//  Created by cudex on 2022/03/14.
//

import UIKit

class thirdViewController: UIViewController {

    @IBOutlet weak var outPutLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonAction(_ sender: Any) {
        
        outPutLable.text = "3번 버튼 클릭"
    }
}

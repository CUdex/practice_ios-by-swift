//
//  InstanceDetailViewController.swift
//  DataPassingPracticeApp
//
//  Created by cudex on 2022/03/26.
//

import UIKit

class InstanceDetailViewController: UIViewController {
    
    var mainVC: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendDataMainVc(_ sender: Any) {
        
        mainVC?.dataLable.text = "some data"
        self.dismiss(animated: true, completion: nil)
    }

}

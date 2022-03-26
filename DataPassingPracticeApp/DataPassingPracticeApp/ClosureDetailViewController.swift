//
//  ClosureDetailViewController.swift
//  DataPassingPracticeApp
//
//  Created by cudex on 2022/03/26.
//

import UIKit

class ClosureDetailViewController: UIViewController {
    
    var myClosure: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closurePassData(_ sender: Any) {
        
        myClosure?("closure String")
        self.dismiss(animated: true, completion: nil)
        
    }
}

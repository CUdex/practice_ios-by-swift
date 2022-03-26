//
//  SegueDetailViewController.swift
//  DataPassingPracticeApp
//
//  Created by cudex on 2022/03/26.
//

import UIKit

class SegueDetailViewController: UIViewController {

    @IBOutlet weak var dataLable: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dataLable.text = dataString
    }

}

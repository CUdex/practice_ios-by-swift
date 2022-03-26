//
//  DetailViewController.swift
//  DataPassingPracticeApp
//
//  Created by cudex on 2022/03/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    var someString = ""

    @IBOutlet weak var someLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        someLable.text = someString
    }

}

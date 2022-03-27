//
//  notiDetailViewController.swift
//  DataPassingPracticeApp
//
//  Created by cudex on 2022/03/27.
//

import UIKit

class notiDetailViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func notiAct(_ sender: Any) {
        let notificationName = Notification.Name("sendSomeString")
        
        let strDic = ["str" : "noti string"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
        
        self.dismiss(animated: true, completion: nil)
    }
}

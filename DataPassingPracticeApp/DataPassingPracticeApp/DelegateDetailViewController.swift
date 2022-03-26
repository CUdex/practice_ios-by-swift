//
//  DelegateDetailViewController.swift
//  DataPassingPracticeApp
//
//  Created by cudex on 2022/03/26.
//

import UIKit


// protocol을 구현
protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(string: String)
    
}

class DelegateDetailViewController: UIViewController {
    
    // 내가 정의하지 않고 다른쪽에서 정의하고 삭제하기 때문에 weak로 설정
    weak var delegate: DelegateDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func passDataToMainVC(_ sender: Any) {
        
        delegate?.passString(string: "delegate pass data")
        self.dismiss(animated: true, completion: nil)
        
        
    }
}

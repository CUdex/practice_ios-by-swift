//
//  MyIDViewController.swift
//  practiceSettingApp
//
//  Created by cudex on 2022/04/02.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // text 입력 시 해당 이벤트를 함수에 주도록 설정
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        nextButton.isEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        
        // 입력을 할 경우 Next 버튼 활성화 설정
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
    
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

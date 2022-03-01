//
//  ViewController.swift
//  SignUpForm_by_UIkit
//
//  Created by cudex on 2022/03/01.
//

import UIKit


// UITextField관련 delegate를 준수하겠다는 의미로 UITextFieldDelegate 추가
class ViewController: UIViewController, UITextFieldDelegate {

//  각 field 및 view 연결
//  inspecter에서 text type을 통해 사용자 편의를 위한 설정
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var blogTextField: UITextField!
    @IBOutlet weak var outPutTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
//    키보드에서 리턴 터치 시 키보드를 내리기 위한 함수 생성
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
//    바탕화면 터치 시 키보드가 내려가도록 함수 구현
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//      키보드를 내려가도록 설정
        self.view.endEditing(true)
    }

//    text view에 사용자 정보를 출력하도록 설정
    @IBAction func signUpAction(_ sender: Any) {
        outPutTextView.text = "\(nameTextField.text!)님 가입을 축하합니다!"
    }
   
    
    
}


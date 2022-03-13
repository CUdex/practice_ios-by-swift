//
//  ViewController.swift
//  flightBookingApp
//
//  Created by cudex on 2022/03/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var departureDateButton: UIButton!
    @IBOutlet weak var returnDateLable: UILabel!
    @IBOutlet weak var returnDateButton: UIButton!
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    // tag를 통한 view 구분
    var buttonTag: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //UI를 숨기기 위한 프로퍼티
        returnDateLable.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
    }

    @IBAction func showDatePickerAction(_ sender: UIButton) {
        // UI 상태에 따라 hidden 상태 변경
        if selectDatePicker.isHidden == false {
            selectDatePicker.isHidden = true
        } else {
            selectDatePicker.isHidden = false
        }
        buttonTag = sender.tag
    }
    
    // Any에서 UISwitch가 들어오기 때문에 파라미터 타입 설정
    @IBAction func showReturnDateAction(_ sender: UISwitch) {
        //sender를 이용한 picker view hidden control
        returnDateLable.isHidden = !returnDateLable.isHidden
        returnDateButton.isHidden = !sender.isOn
    }
    
    @IBAction func selectedDateAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        
        let dateString = formatter.string(from: sender.date)
        // tag를 통한 view의 string 반영
        if buttonTag == 1 {
            departureDateButton.setTitle(dateString, for: UIControl.State.normal)
        } else {
            returnDateButton.setTitle(dateString, for: UIControl.State.normal)
        }
        
    }
    
    // 배경 터치 시 pickerview 숨김
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        selectDatePicker.isHidden = true
    }
    
}


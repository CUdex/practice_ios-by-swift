//
//  ViewController.swift
//  selectCarApp
//
//  Created by cudex on 2022/03/13.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerViewControl: UIPickerView!
    
    // picker view에 들어갈 데이터 초기화
    let carCompanyName = ["Tesla", "Lamborghini", "Porsche"]
    var carModel = [String]()
    var carModelImage = [String]()
    
    // 차량 모델
    let tesla = ["Model S", "Model X"]
    let lamborghini = ["aventador", "veneno", "huracan"]
    let porsche = ["911", "boxter"]
    
    // 이미지
    let teslaImageNames = ["tesla-model-s.jpg", "tesla-model-x.jpg"]
    let lamborghiniImageName = ["lamborghini-aventador.jpg", "lamborghini-huracan.jpg", "lamborghini-veneno.jpg"]
    let porscheImageNames = ["porsche-911.jpg","porsche-boxter.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지 끝 부분 처리
        imageView.layer.cornerRadius = 50.0
        imageView.layer.masksToBounds = true
        pickerViewControl.dataSource = self
        pickerViewControl.delegate = self
        carModel = tesla
        carModelImage = teslaImageNames
        print("didnload \(pickerViewControl.selectedRow(inComponent: 1))")
    }
    
    
    // UIPicker View에 들어갈 component 값 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    // 각 component의 row 값 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 각 컴포넌트 별 row 갯수 설정
        if component == 0 {
            return carCompanyName.count
        } else {
            return carModel.count
        }
    }
    
    // picker view에 데이터 입력
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carCompanyName[row]
        } else {
            return carModel[row]
        }
    }
    
    
    // 0 component값에 따라 1 component의 문자열 변경
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0  && row == 0 {
            carModel = tesla
            carModelImage = teslaImageNames
        } else if component == 0  && row == 1 {
            carModel = lamborghini
            carModelImage = lamborghiniImageName
        } else if component == 0 && row == 2{
            carModel = porsche
            carModelImage = porscheImageNames
        }
        
        // 0번 컴포넌트 값이 변경될 때마다 1번 컴포넌트 row 값 1번으로 고정
        if component == 0 {
            pickerView.selectRow(1, inComponent: 1, animated: true)
        }
        // 변경된 문자열 반영을 위해 reload 수행
        pickerView.reloadAllComponents()
        
        // picker view가 클릭 될 때마다 1번 component의 row 값을 문자열에 반영하여 이미지 출력
         imageView.image = UIImage(named: carModelImage[pickerView.selectedRow(inComponent: 1)])
    }
}


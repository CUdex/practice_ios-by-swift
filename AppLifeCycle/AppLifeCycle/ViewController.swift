//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by cudex on 2022/03/03.
//

import UIKit

class ViewController: UIViewController {

//    override func loadView() {
//        // 상위 클레스 초기화를 해야 정상적으로 사용 가능
//        super.loadView()
//        print("load view")
//    }
    
    // view가 호출 시 가장 먼저 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("load did view")
    }
    
    
    //view 전환 시 호출되는 함수 정리
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    
    
    
    


}
 

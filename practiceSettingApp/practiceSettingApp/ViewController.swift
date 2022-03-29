//
//  ViewController.swift
//  practiceSettingApp
//
//  Created by cudex on 2022/03/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.dataSource = self
        settingTableView.delegate = self
        
        // tableView에 Cell 등록
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }
}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // row 값을 기준으로 사용되는 Cell 선택
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
            
            return cell
        }
        
    }
    
    //Cell 크기 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.row == 0 {
            return 80
        }
        return 90
    }
    
    
}

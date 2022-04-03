//
//  ViewController.swift
//  practiceSettingApp
//
//  Created by cudex on 2022/03/28.
//

import UIKit

class ViewController: UIViewController {
    
    // 구조체를 이용하여 데이터 구조 구현
    var settingModel = [[SettingModel]]()

    @IBOutlet weak var settingTableView: UITableView!
    
    // 세부화면 이동 시 설정 값이 바뀌어 appear로 처리
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.dataSource = self
        settingTableView.delegate = self
        
        // tableView에 Cell 등록
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        // tableview background color 변경
        settingTableView.backgroundColor = UIColor(white: 233/255, alpha: 1)
 
        
        // navigation title 설정
        title = "Settings"
        // settings 문구 움직임
 
        self.view.backgroundColor = UIColor(white: 233/255, alpha: 1)
        makeData()
    }
    
    func makeData() {
        settingModel.append([SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTitle: "Set up iCloud", rightImageName: nil)])
        settingModel.append([SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
                             SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
                             SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")])
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //section에 따른 필요 row 값 설정
        return settingModel[section].count
    }
    
    // section 갯수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        settingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // section 값을 기준으로 사용되는 Cell 선택
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
            cell.leftImage.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.rightImage.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
            
            return cell
        }
        
    }
    
    //Cell 크기 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.section == 0 {
            return 100
        }
        return 50
    }
    
    // cell 선택 시 action 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let myidVC = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            self.present(myidVC, animated: true, completion: nil)
        }
        else if indexPath.section == 1 && indexPath.row == 0 {
            if let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(withIdentifier: "GeneralViewController") as? GeneralViewController {
                self.navigationController?.pushViewController(generalVC, animated: true)
            }
        }
    }
    
    
}

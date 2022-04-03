//
//  GeneralViewController.swift
//  practiceSettingApp
//
//  Created by cudex on 2022/03/31.
//

import UIKit

// 간단한 cell 생성(잘 사용하지 않음)
class GeneralCell: UITableViewCell {
    
    @IBOutlet weak var leftLable: UILabel!
    // didset을 이용하여 호출되는 순간 세팅
    @IBOutlet weak var rightImage: UIImageView! {
        didSet {
            rightImage.image = UIImage.init(systemName: "chevron.right")
        }
    }
}


class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model = [[GeneralModel]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    //section 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        
        cell.leftLable.text = model[indexPath.section][indexPath.row].leftLable
        
        return cell
    }
    

    @IBOutlet weak var generalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "General"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = UIColor(white: 233/255, alpha: 1)
        
        model.append([GeneralModel(leftLable: "About")])
        
        model.append(
        [GeneralModel(leftLable: "Keyboard"),
        GeneralModel(leftLable: "Fonts"),
        GeneralModel(leftLable: "Language & Region"),
        GeneralModel(leftLable: "Dictionary")])
        
        model.append([GeneralModel(leftLable: "Reset")])
    }

}

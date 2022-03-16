//
//  ViewController.swift
//  weatherTableApp
//
//  Created by cudex on 2022/03/15.
//

import UIKit

class ViewController: UIViewController {

    
    // 데이터를 넣을 딕셔너리 생성
    var dataList = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var weatherNum = 0
        
        // 데이터 생성
        for num in 1...18 {
            weatherNum = Int.random(in: 0...4)
            switch weatherNum {
            case 0 :
                dataList.append(["local":"Korea\(num)","weather":"sunny"])
            case 1:
                dataList.append(["local":"Korea\(num)","weather":"snow"])
            case 2:
                dataList.append(["local":"Korea\(num)","weather":"cloudy"])
            case 3:
                dataList.append(["local":"Korea\(num)","weather":"blizzard"])
            default :
                dataList.append(["local":"Korea\(num)","weather":"rainy"])
            }
        }
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // default로 들어간 값
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        // indexPath는 구조체이며 그 안에 인자값으로 row, section 등이 있다.
        let dicTemp = dataList[indexPath.row]
        
        content.text = dicTemp["local"]
        
        let weatherText = dicTemp["weather"]
        content.secondaryText = weatherText
        
        // weather의 value에 따라 이미지 저장
        switch weatherText {
        case "rainy" :
            content.image = UIImage(named: "rainy.png")
        case "blizzard":
            content.image = UIImage(named: "blizzard.png")
        case "snow":
            content.image = UIImage(named: "snow.png")
        case "cloudy":
            content.image = UIImage(named: "cloudy.png")
        default:
            content.image = UIImage(named: "sunny.png")
        }
        
        // 설정된 cell configuration 저장
        cell.contentConfiguration = content
        
        //cell 값 리턴
        return cell
    }
    
    
}


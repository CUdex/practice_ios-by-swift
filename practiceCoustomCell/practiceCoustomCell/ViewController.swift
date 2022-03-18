//
//  ViewController.swift
//  practiceCoustomCell
//
//  Created by cudex on 2022/03/17.
//

import UIKit

class ViewController: UIViewController {
    var itemList = [[String:String]]()

    @IBOutlet weak var tableViewFruit: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewFruit.delegate = self
        tableViewFruit.dataSource = self
        // tableview background를 투명하게
        tableViewFruit.backgroundColor = UIColor.clear
        
        var num: Int = 0
        let fruit:[String] = ["apple.jpeg","blueberry.jpg","carrot.jpg","cherry.png","grape.jpg","kiwi.png","lemon.png","lime.jpg","meat.jpg","strawberry.jpg","tomato.png","vegetable.jpg","watermelon.png"]
        
        for i in 0...19 {
            num = Int.random(in: 0...12)
            itemList.append(["name":"fruit\(i)","image":fruit[num],"amount":"\(i)","value":"\(num)000원"])
        }
        
    }
    
    
    // 데이터를 다음 세그웨이에 넘겨주기 위한 메소드
    // 옆으로 세그웨이가 넘어갈 때 호출되는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            //넘어간 데이터를 형 변환 후 데이터를 넘김
            (segue.destination as! DetailViewController).detailData = itemList[tableViewFruit.indexPathForSelectedRow!.row] // tableview의 선택된 row 값 조회
        }
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        let tempValue:[String:String] = itemList[indexPath.row]
        
        cell.imgView.contentMode = UIView.ContentMode.scaleAspectFill
        cell.imgView.layer.cornerRadius = 50.0
        cell.imgView.layer.masksToBounds = true
        cell.imgView.image = UIImage(named: tempValue["image"]!)
        cell.amountLable.text = tempValue["amount"]
        cell.nameLable.text = tempValue["name"]
        cell.valueLable.text = tempValue["value"]
        // cell View 백그라운드 투명하게
        cell.backgroundColor = UIColor.clear
        
        
        return cell
    }

}

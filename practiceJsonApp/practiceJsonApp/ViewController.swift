//
//  ViewController.swift
//  practiceJsonApp
//
//  Created by cudex on 2022/03/25.
//

import UIKit

// json data를 받기 위한 구조체 생성
struct Weather: Decodable {
    let country: String
    let weather: String
    let temperature: String
}

class ViewController: UIViewController {
    
    var dataList = [Weather]()
    @IBOutlet weak var weatherTable: UITableView!
    
    @IBAction func goToView(_ sender: Any) {
        
        // button을 통한 화면 이동
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let testVC = storyBoard.instantiateViewController(withIdentifier: "testVC") as! testVC
        self.present(testVC, animated: false, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherTable.dataSource = self
        let urlString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/swift4weather.json"
        guard let jsonURL = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: jsonURL, completionHandler: {(data, response, error) -> Void in
            guard let data = data else { return }
            // error 발생 시 catch 하기 위한 문법
            do {
                self.dataList = try JSONDecoder().decode([Weather].self, from: data)
                print(self.dataList)
                DispatchQueue.main.async(execute: {
                    self.weatherTable.reloadData()
                })
            } catch {
                print("Parsing error : because \(error)")
            }
        }).resume()
        
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCellController

        let structTemp = dataList[indexPath.row]
        
        cell.weatherLable.text = structTemp.weather
        cell.countryLable.text = structTemp.country
        cell.temperatureLable.text = structTemp.temperature
        let weatherText = structTemp.weather
        
        switch weatherText {
        case "비" :
            cell.imgView.image = UIImage(named: "rainy.png")
        case "우박":
            cell.imgView.image = UIImage(named: "blizzard.png")
        case "눈":
            cell.imgView.image = UIImage(named: "snow.png")
        case "구름":
            cell.imgView.image = UIImage(named: "cloudy.png")
        default:
            cell.imgView.image = UIImage(named: "sunny.png")
        }
        
        return cell
    }
}

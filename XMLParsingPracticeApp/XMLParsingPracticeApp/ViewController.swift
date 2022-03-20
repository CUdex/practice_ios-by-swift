//
//  ViewController.swift
//  XMLParsingPracticeApp
//
//  Created by cudex on 2022/03/20.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {
    
    var weatherData = [[String:String]]()
    var detailData = [String:String]()
    var elementTemp: String = ""
    // 파싱 작업을 할 때 개행을 키값으로 잡지 않도록 설정하기 위한 Bool 값
    var blank: Bool = false
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewOutlet.dataSource = self
        
        //xml data를 가져올 url 주소
        let urlString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        
        // url를 정상적으로 못가져오면 error 출력
        guard let baseURL = URL(string: urlString) else {
            print("URL ERROR")
            return
        }
        
        // parsing에 실패하면 error 출력
        guard let parser = XMLParser(contentsOf: baseURL) else {
            print("content ERROR")
            return
        }
        
        // parsing
        parser.delegate = self
        if !parser.parse() {
            print("Parse Failure")
        }
    }
    
    // 파싱하는 메소드
    // elementName에 XML element값이 출력
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // element를 키값으로 사용하기 위해 문자열 저장
        elementTemp = elementName
        // 정상적인 element값으로 처리
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        // element 값 예외가 필요한 경우 처리
        // <asd>asda</asda>의 경우 >의 뒤쪽 개행을 스트링으로 파싱하기 때문에 빈 값이 들어갈 수 있다. 이를 위해 blank를 이용하여 처리한다.
        // 키 값에 space나 newline이 있는 경우 없애기 위하여 trimming사용
        if blank == true && elementTemp != "local" && elementTemp != "weatherinfo"{
            detailData[elementTemp] = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // element가 끝나면 호출되는 함수
        if elementName == "local" {
            weatherData += [detailData]
        }
        // 개행 element를 통해 데이터가 수정되지 않도록 false
        blank = false
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! weatherCellController
        
        let tempData = weatherData[indexPath.row]
        let weatherStr = tempData["weather"]
        
        cell.countryLable.text = tempData["country"]
        cell.temperatureLable.text = tempData["temperature"]
        cell.weatherLable.text = weatherStr
        
        switch weatherStr {
        case "맑음":
            cell.imgView.image = UIImage(named: "sunny.png")
        case "비":
            cell.imgView.image = UIImage(named: "rainy.png")
        case "흐림":
            cell.imgView.image = UIImage(named: "cloudy.png")
        case "눈":
            cell.imgView.image = UIImage(named: "snow.png")
        default:
            cell.imgView.image = UIImage(named: "blizzard.png")
        }
        
        return cell
    }
}

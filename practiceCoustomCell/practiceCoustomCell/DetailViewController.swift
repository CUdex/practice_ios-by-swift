//
//  DetailViewController.swift
//  practiceCoustomCell
//
//  Created by cudex on 2022/03/18.
//

import UIKit


//테이블 선택 시 선택된 테이블의 테이터를 받아서 화면에 출력 하는 viewcontroller
class DetailViewController: UIViewController {
    
    
    
    var detailData = [String:String]()

    @IBOutlet weak var valueLable: UILabel!
    @IBOutlet weak var amountLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailData)
        imgView.contentMode = UIView.ContentMode.scaleAspectFill
        imgView.layer.cornerRadius = 100.0
        imgView.layer.masksToBounds = true
        imgView.image = UIImage(named: detailData["image"]!)
        amountLable.text = detailData["amount"]
        nameLable.text = detailData["name"]
        valueLable.text = detailData["value"]

        // Do any additional setup after loading the view.
    }

}

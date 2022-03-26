//
//  ViewController.swift
//  DataPassingPracticeApp
//
//  Created by cudex on 2022/03/26.
//  데이터를 다른 view로 보내주는 passing 방법 연습

import UIKit

// 데이터를 넘겨주는 6가지 방법



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 1. property
    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)

        // property를 이용한 데이터 넘겨주기
       // detailVC.someString = "SomeString"

        self.present(detailVC, animated: true, completion: nil)

        // 직접 IBOutlet property에 접근하려면 인스턴스화되고 화면이 메모리에 올라온 이후에 접근 가능하다. 때문에 present명령어로 호출이후에 접근가능 즉 viewDidLoad 이후에 접근 가능
        // app이 죽을 가능성이 높기 때문에 잘 사용하지 않음
        detailVC.someLable.text = "sadas"
    }
    
    // 2. segue
    // storyboard에서 다른 viewcontroller 선택 후 일반적으로 show 선택
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "asdqwe"
            }
        }
    }
    
    // 3. instance
    // 인스턴스를 통으로 넘기는 방법
    @IBOutlet weak var dataLable: UILabel!
    
    @IBAction func moveToInstance(_ sender: Any) {
        
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        detailVC.mainVC = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    //4. delegate (delegation) pattern 대리 위임 대신
    
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // 5. closure
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        // closure 구현
        detailVC.myClosure = { str in
            self.dataLable.text = str
        }
        self.present(detailVC, animated: true, completion: nil)
        
    }
    

}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLable.text = string
    }
    
    
}






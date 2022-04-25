//
//  DetailViewController.swift
//  NavigationPracticeApp
//
//  Created by cudex on 2022/04/24.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.backgroundColor = .yellow
        self.statusBar?.backgroundColor = .yellow
        makeRightAlramButton(self)
    }
    
}

extension UIViewController {
    
    var statusBar: UIView? {
        // status bar 영역에도 적용
        // SceneDelegate에서 statusBarView 추가
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        sceneDelegate?.statusBarView.backgroundColor = .red
        
        
        // 모든 화면에 표출하기 위해 window에 view를 올린다.
        //let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        let window2 = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.filter{ $0.isKeyWindow }.first
        
        if let hasStatusBar = sceneDelegate?.statusBarView {
            window2?.addSubview(hasStatusBar)
            //해당 view에서만 사용
            //self.view.addSubview(hasStatusBar)
        }
        
        return sceneDelegate?.statusBarView
        
    }
    
    func makeRightAlramButton(_ sender: UIViewController) {
//        let image = UIImage(systemName: "alarm")
//        let rightItem = UIBarButtonItem(image: image, style: .done, target: sender, action: #selector(testAction))
//
//        let rightItem2 = UIBarButtonItem(image: image, style: .done, target: sender, action: #selector(testAction))
//        // rightbutton 위치 변경
//        rightItem2.imageInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
//
//
//        sender.navigationItem.rightBarButtonItems = [rightItem, rightItem2]
        
        
        // system image 크기 조절
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(systemName: "alarm", withConfiguration: config)?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn1.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        let btn2 = UIButton()
        btn2.setImage(UIImage(systemName: "alarm", withConfiguration: config), for: .normal)
        btn2.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [btn1, btn2])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        
        let customItem = UIBarButtonItem(customView: stackView)
        
        sender.navigationItem.rightBarButtonItem = customItem
    }
    
    @objc func testAction() {
        print("action!")
    }
    
}

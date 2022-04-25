//
//  ViewController.swift
//  NavigationPracticeApp
//
//  Created by cudex on 2022/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // self.navigationItem.title = "mian view"
        setNaviTitleButton()
        
        makeNaviBackButton()
        makeRightAlramButton(self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        naviBackgroundDesign()
    }
    
//    func makeRightAlramButton(_ sender: UIViewController) {
//        let image = UIImage(systemName: "alarm")
//        
//        let rightItem = UIBarButtonItem(image: image, style: .done, target: sender, action: #selector(ViewController.testAction))
//        
//        sender.navigationItem.rightBarButtonItem = rightItem
//    }
    
    
    
    func naviBackgroundDesign() {
        self.navigationController?.navigationBar.backgroundColor = .red
        //self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        self.statusBar?.backgroundColor = .red
    }
    
    
    func makeNaviBackButton() {
        // text
        self.navigationItem.backButtonTitle = ""
        // image
        // self.navigationItem.backBarButtonItem = UIBarButtonItem(systemItem: .bookmarks)
        
        //백 버튼 화살표 모양 수정
        guard var backImage = UIImage(systemName: "backward.fill") else {
            return
        }
        // image 설정
        backImage = backImage.withRenderingMode(.alwaysOriginal)
        
        let newImage = resizeImage(image: backImage, newWidth: 20, newHeight: 20)
        
        // 2개 다 설정이 필요
        self.navigationController?.navigationBar.backIndicatorImage = newImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = newImage
        
        //색깔 수정
        self.navigationController?.navigationBar.tintColor = .orange
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage? {

        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        
        // image의 빈 도화지를 만들고 새 이미지를 할당
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    func setNaviTitleButton() {
        // 버튼 넣기
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        self.navigationItem.titleView = btn
    }
    
    func setNaviTitleImage() {
        // image 넣기
        let logo = UIImageView(image: UIImage(named: "Samsung_Logo.png"))
        
        logo.contentMode = .scaleAspectFit
        logo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.navigationItem.titleView = logo
    }
    
//    @objc func testAction() {
//        print("action!")
//    }


}


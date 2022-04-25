//
//  ViewController.swift
//  SymbolRoller
//
//  Created by cudex on 2022/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textLable: UILabel! {
        didSet {
            return self.textLable.font = UIFont.boldSystemFont(ofSize: 30)
        }
    }
    @IBOutlet weak var changeButton: UIButton! {
        didSet {
            self.changeButton.layer.cornerRadius = self.changeButton.layer.bounds.height / 2
            
            let image = UIImage(systemName: "arrow.triangle.2.circlepath")
            let resizeImage = image?.resizeImageTo(size: CGSize(width: 45, height: 40))?.withRenderingMode(.alwaysTemplate)
            
            var config = UIButton.Configuration.plain()
            config.title = "Reload"
            config.image = resizeImage
            config.subtitle = "click item to reload"
            config.imagePadding = 5
            config.baseForegroundColor = .white
            config.attributedTitle?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            changeButton.configuration = config
        }
    }
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "heart", "sum"]

    override func viewDidLoad() {
        super.viewDidLoad()
        initAppPage()
    }

    func initAppPage() {
        
        let symbol = symbols.randomElement() ?? "sun.min"
        
        imgView.image = UIImage(systemName: symbol)?.withRenderingMode(.alwaysOriginal)
        if symbol == "sun.min" {
            textLable.text = "sun"
        } else {
            textLable.text = symbol
        }
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        initAppPage()
    }
    
}


extension UIImage {
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}


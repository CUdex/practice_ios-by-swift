//
//  ViewController.swift
//  miniBrowserByUIkit
//
//  Created by cudex on 2022/03/05.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        spinningActivityIndicatorView.hidesWhenStopped = true
        spinningActivityIndicatorView.startAnimating()
        // 초기 실행 시 facebook 호출하기 위한 함수
        let initUrl = "https://www.facebook.com"
        let myUrl = URL(string: initUrl)
        let urlRequest = URLRequest(url: myUrl!)
        mainWebView.load(urlRequest)
        urlTextField.text = initUrl
        spinningActivityIndicatorView.stopAnimating()
        
    }
    
    
    @IBAction func bookMarkAction(_ sender: Any) {
        
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        let initUrl = "https://www.\(bookMarkUrl!).com"
        mainWebView.load(URLRequest(url: URL(string: initUrl)!))
        urlTextField.text = initUrl
    }
    @IBAction func goBackAction(_ sender: Any) {
    }
    @IBAction func goForwardAction(_ sender: Any) {
    }
    @IBAction func stopLoadingAction(_ sender: Any) {
    }
    @IBAction func reloadAction(_ sender: Any) {
    }
    
    


}


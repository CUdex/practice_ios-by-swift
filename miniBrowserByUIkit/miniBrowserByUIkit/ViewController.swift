//
//  ViewController.swift
//  miniBrowserByUIkit
//
//  Created by cudex on 2022/03/05.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {

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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        // 입력값에 https가 있는 지 확인하고 없을 경우 자동으로 추가
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(urlTextField.text!)"
        }
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        // go 버튼을 누르면 키보드 제거
        textField.resignFirstResponder()
        return true
    }
    
    
    // 웹 이동 네비게이터
    @IBAction func goBackAction(_ sender: Any) {
        mainWebView.goBack()
    }
    @IBAction func goForwardAction(_ sender: Any) {
        mainWebView.goForward()
    }
    @IBAction func stopLoadingAction(_ sender: Any) {
        mainWebView.stopLoading()
    }
    @IBAction func reloadAction(_ sender: Any) {
        mainWebView.reload()
    }
    
    


}


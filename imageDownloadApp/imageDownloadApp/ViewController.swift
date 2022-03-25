//
//  ViewController.swift
//  imageDownloadApp
//
//  Created by cudex on 2022/03/20.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var downloadTask: URLSessionDownloadTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressView.progress = 0.0
        indicatorView.hidesWhenStopped = true
    }

    @IBAction func DownLoadAction(_ sender: Any) {
        imgView.image = nil
        indicatorView.startAnimating()
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        downloadTask.resume()
    }
    @IBAction func suspendAction(_ sender: Any) {
        downloadTask.suspend()
    }
    @IBAction func resumeAction(_ sender: Any) {
        downloadTask.resume()
    }
    @IBAction func cancelAction(_ sender: Any) {
        downloadTask.cancel()
        progressView.setProgress(0.0, animated: false)
        indicatorView.stopAnimating()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        // 데이터 저장
        print(location)
        let dataTemp:Data = try! Data(contentsOf: location)
        // 저장된 데이터를 UIImage로 구현
        imgView.image = UIImage(data: dataTemp)
        indicatorView.stopAnimating()
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress: Float = Float(totalBytesWritten / totalBytesExpectedToWrite)
        progressView.setProgress(progress, animated: true)
    }
}


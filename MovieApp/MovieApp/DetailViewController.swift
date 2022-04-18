//
//  DetailViewController.swift
//  MovieApp
//
//  Created by cudex on 2022/04/18.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {
    
    var movieResult: ResultData?
    
    var player: AVPlayer?

    @IBOutlet weak var movieContainer: UIView!
    @IBOutlet weak var titleLable: UILabel! {
        didSet {
            titleLable.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        }
    }
    @IBOutlet weak var desciptionLable: UILabel! {
        didSet {
            desciptionLable.font = UIFont.systemFont(ofSize: 15, weight: .light)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLable.text = movieResult?.trackName
        desciptionLable.text = movieResult?.longDescription
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let hasURL = movieResult?.previewUrl {
            makePlayerAndPlay(urlString: hasURL)
        }
    }
    @IBAction func play(_ sender: Any) {
        self.player?.play()
    }
    @IBAction func stop(_ sender: Any) {
        self.player?.pause()
    }
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func makePlayerAndPlay(urlString: String) {
        
        if let hasUrl = URL(string: urlString){
            self.player = AVPlayer(url: hasUrl)
            let playerLayer = AVPlayerLayer(player: player)
            
            movieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = movieContainer.bounds
            // 영상 재생
            self.player?.play()
        }
    }

}

//
//  ViewController.swift
//  MovieApp
//
//  Created by cudex on 2022/04/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieShowTableView: UITableView!
    var movieModel: MovieModel?
    
    var networkLayer = NetworkLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        movieShowTableView.delegate = self
        movieShowTableView.dataSource = self
        self.movieShowTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        searchBar.delegate = self
        requestMovieAPI("mavel")
    }
    
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        networkLayer.request(type: .justURL(urlString: urlString)) { data, response, error in
            if let hasData = data {
                completion(UIImage(data: hasData))
                return
            }
            completion(nil)
        }
    }
    
    
    // image 가져오기
    // escaping은 클로저 내 로직을 바깥으로 가지고 가기위해 필요
//    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        if let hasUrl = URL(string: urlString) {
//            var request = URLRequest(url: hasUrl)
//            request.httpMethod = "GET"
//
//            session.dataTask(with: request) { data, response, error in
//                print ((response as! HTTPURLResponse).statusCode)
//
//                if let hasData = data {
//                    completion(UIImage(data: hasData))
//                    return
//                }
//
//
//            }.resume()
//            session.finishTasksAndInvalidate()
//        }
//
//        // function을 사용하지 못하게되면 function이 메모리를 계속 가지고 있기 때문에 nil로 끝내야한다.
//        completion(nil)
//
//    }
    
    func requestMovieAPI(_ term: String) {
        let term = URLQueryItem(name: "term", value: term)
        let media = URLQueryItem(name: "media", value: "movie")
        let querys = [term, media]
        
        networkLayer.request(type: .searchMovie(querys: querys)) { data, response, error in
            
            if let hasData = data {
                do {
                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
                    print(self.movieModel ?? "had no data")

                    DispatchQueue.main.async {
                        self.movieShowTableView.reloadData()
                    }
                }catch{
                    print(error)
                }
            }
        }
    }
    
    
    
    
    //network 호출
//    func requestMovieAPI(_ term: String) {
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//        var components = URLComponents(string: "https://itunes.apple.com/search")
//
//        let term = URLQueryItem(name: "term", value: term)
//        let media = URLQueryItem(name: "media", value: "movie")
//
//        components?.queryItems = [term, media]
//
//        guard let url = components?.url else {
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = session.dataTask(with: request) { data, response, error in
//            print( (response as! HTTPURLResponse).statusCode )
//
//            //data는 body 부분을 의미
//            //data를 decoding 해줘야 한다.
//            if let hasData = data {
//
//                do {
//                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
//                    print(self.movieModel ?? "had no data")
//
//                    DispatchQueue.main.async {
//                        self.movieShowTableView.reloadData()
//                    }
//                }catch{
//                    print(error)
//                }
//            }
//
//        }
//        task.resume()
//        session.finishTasksAndInvalidate()
//    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
    }
    
    
    // 콘텐츠 내용만큼 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        
        cell.titleLable.text = self.movieModel?.results[indexPath.row].trackName
        cell.descriptionLable.text = self.movieModel?.results[indexPath.row].shortDescription
        
        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        let price = self.movieModel?.results[indexPath.row].trackPrice?.description ?? ""
        
        cell.priceLable.text = currency + price
        
        // image 설정
        if let hasUrl = self.movieModel?.results[indexPath.row].artworkUrl100 {
            self.loadImage(urlString: hasUrl) { image in
                DispatchQueue.main.async {
                    cell.Movieimg.image = image
                }
            }
        }
        
        
        // 날짜 표기 설정
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate {
            let formatter = ISO8601DateFormatter()
            if let isoDate = formatter.date(from: dateString) {
                let myFormatter = DateFormatter()
                myFormatter.dateFormat = "yyyy년 MM월 dd일"
                
                let dateString = myFormatter.string(from: isoDate)
                
                cell.dataLable.text = dateString
            }
        }
        return cell
    }
    
    // cell이 클릭했을때 실행되는 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // storyboard 가져오기
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailVC.movieResult = self.movieModel?.results[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true) { }
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let hasText = searchBar.text {
            requestMovieAPI(hasText)
            self.view.endEditing(true)
        }
        
    }
}

//
//  NetworkLayer.swift
//  MovieApp
//
//  Created by cudex on 2022/04/20.
//

import Foundation

enum MovieRequestType{
    case justURL(urlString: String)
    case searchMovie(querys: [URLQueryItem])
}

enum APIError: Error {
    case BadURL
    case BadImage
}

// request 관련 function 정리
class NetworkLayer {
    
    // type 정의
    typealias NetworkCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    // only url
    // url + param
    // data를 클로저 밖에 있는 completion 함수에 전달하기 위해 escaping 명시
    func request(type: MovieRequestType, completion: @escaping NetworkCompletion) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        do {
            let request = try buildRequest(type: type)
            
            session.dataTask(with: request) { data, response, error in
                print ((response as! HTTPURLResponse).statusCode)
                
                completion(data, response, error)
                   
            }.resume()
            session.finishTasksAndInvalidate()
        } catch {
            print(error)
        }

    }
    
    private func buildRequest(type: MovieRequestType) throws -> URLRequest {
        switch type {
        case .justURL(urlString: let urlString):
            guard let hasUrl = URL(string: urlString) else {
                throw APIError.BadURL
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            return request
            
        case .searchMovie(querys: let querys):
            var components = URLComponents(string: "https://itunes.apple.com/search")
            components?.queryItems = querys
            guard let hasUrl = components?.url else {
                throw APIError.BadURL
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            return request
        }
        
        
    }
    
    
    
    
    
}



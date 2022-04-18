//
//  MovieModel.swift
//  MovieApp
//
//  Created by cudex on 2022/04/11.
//

import Foundation



// json 데이터를 저장할 구조체 생성
struct MovieModel: Codable {
    
    let resultCount: Int
    let results: [ResultData]
}

// results 안에 들러갈 구조체 생성
struct ResultData: Codable {
    
    let trackName: String?
    let previewUrl: String?
    let artworkUrl100: String?
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate: String?
    //let image: String
    
    
//    // key 값을 json data와 다르게 사용하고 싶을 경우 구현
//    enum CodingKeys: String, CodingKey {
//        case image = "artworkUrl100"
//        case trackName
//        case previewUrl
//    }
}

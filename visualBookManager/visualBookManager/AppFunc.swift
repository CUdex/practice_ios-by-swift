//
//  AppFunc.swift
//  visualBookManager
//
//

import Foundation

struct Book {
    var name: String
    var author: String
    var genre: String
}


class BookManager {
    var bookList = [Book]()
    
    func regiterBook(objectBook:Book) {
        
    }
    func searchBook(name: String) -> String {
        return " "
    }
    func removeBook(name: String) {
        
    }
    func showAllBook() -> String {
        return " "
    }
    func bookCount() -> Int {
        return bookList.count
    }
}

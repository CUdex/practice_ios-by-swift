//
//  BookManager.swift
//  practice_bookmanager
//
//  Created by 류찬울 on 2021/12/25.
//

import Foundation

class BookManager{
    var bookList = [Book]()
    
    func registerBook(objectBook:Book){
        bookList.append(objectBook)
        print("등록이 완료되었습니다!")
    }
    
    func showAllBooks() -> String {
        print("-----책 리스트------")
        var booksName: String = ""
        for bookNow in bookList {
            booksName += "name : \(bookNow.name!)\n"
            booksName += "gerne : \(bookNow.gerne!)\n"
            booksName += "author : \(bookNow.author!)\n"
            booksName += "------------------\n"
        }
        return booksName
    }
    
    func countBooks() -> Int {
        return bookList.count
    }

    func searchBooks(name:String) -> String? {
        var strTemp:String = ""
        for bookTemp in bookList {
            if bookTemp.name == name {
                strTemp += "name : \(bookTemp.name!)\n"
                strTemp += "gerne : \(bookTemp.gerne!)\n"
                strTemp += "author : \(bookTemp.author!)\n"
                strTemp += "------------------\n"
                
                return strTemp
            }
        }
        return nil
    }

    func removeBook(name:String){
        for (index, value) in bookList.enumerated() {
            if name == value.name {
                bookList.remove(at: index)
            }
        }
    }
}

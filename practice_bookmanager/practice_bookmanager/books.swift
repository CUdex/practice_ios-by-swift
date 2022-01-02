//
//  books.swift
//  practice_bookmanager

// 책의 정보를 저장하기 위한 구조체 생성

struct Book {
    var name: String?
    var gerne: String?
    var author: String?
    
    func booksInfo() {
        print("book name: \(name!)\nbook ger: \(gerne!)\nbook author: \(author!)")
    }
}

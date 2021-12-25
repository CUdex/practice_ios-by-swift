//
//  main.swift
//  practice_bookmanager
//
//  Created by 류찬울 on 2021/12/25.
//

import Foundation

print("Hello, World!")
print("start")

// 구조체 테스트
var books1 = Book(name: "초코송이", gerne: "초코초코", author: "오리온 초코")
var books2 = Book(name: "초코송이2", gerne: "초코초코2", author: "오리온 초코2")
var books3 = Book(name: "초코송이3", gerne: "초코초코3", author: "오리온 초코3")

var myBookManger = BookManager()
myBookManger.registerBook(objectBook: books1)
myBookManger.registerBook(objectBook: books2)
myBookManger.registerBook(objectBook: books3)

print(myBookManger.showAllBooks())
print(myBookManger.countBooks())

let testList = ["초초초초", "초코송이2", "초코송이3"]

for test in testList {
    print("--검색 결과--")
    if let searchResult = myBookManger.searchBooks(name: test) {
        print(searchResult)
    }
    else {
        print("찾는 책 없습니다 호갱님 ^^;;\n")
    }
}

print("책 삭제------------\n\n")
myBookManger.removeBook(name: "sadaasd")
myBookManger.removeBook(name: "초코송이")
print(myBookManger.showAllBooks())



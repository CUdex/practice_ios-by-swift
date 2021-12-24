//: [Previous](@previous)

import Foundation

// 일반적인 줄바꿈
var greeting = "Hello, playground. \nnice meeting you \" iam beginner\""

print(greeting)

// """를 이용한 줄바꿈
var str:String = """
으아아아아아아
공부하기 싫다다다다
노는게 제일 좋아
"""

print(str)

// 빈 문자열
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Noting better than you~")
}

// 문자열 더하기
let string1 = "hello"
let string2 = " there"

var welcome = string1 + string2
print(welcome)

var instru = "look over"
instru += string2
print(instru)











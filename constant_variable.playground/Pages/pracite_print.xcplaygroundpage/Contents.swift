import UIKit

// type inference
var greeting = "Hello, playground"
var version = 1.0
let year = 2021
let handsome = true

// type annotation
var str:String = """
Hello, playground
sadsadasd
asdsadasdas
sadasdasdas
"""
var version2:Double = 1.0
let year2:Int = 2021
let handsome2:Bool = true

print("str : \(type(of: greeting))")
print(greeting)

print("version : \(type(of: version))")
print(version)

print("year : \(type(of: year))")
print(year)

print("handsome : \(type(of: handsome))")
print(handsome)

print("str : \(type(of: str))")
print(str)

print("version2 : \(type(of: version2))")
print(version2)

print("year2 : \(type(of: year2))")
print(year2)

print("handsome2 : \(type(of: handsome2))")
print(handsome2)

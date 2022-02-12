////: [Previous](@previous)
//
//import Foundation
//
//var greeting = "Hello, playground"
//
//print(greeting)
//
////: [Next](@next)
//
//
//// 8급 문제 들어온 int를 한자릿수로 나누어 array로 반환하는 문제
//
//var testNum: Int = 123456
//
//func digitize(_ num:Int) -> [Int] {
//    if num == 0 {
//        return [0]
//    }
//
//    var result = [Int]()
//    var acuNumber = num
//
//    while acuNumber > 0 {
//        result.append(acuNumber % 10)
//        acuNumber /= 10
//    }
//    return result
//}
//print(digitize(testNum))
//
//// best pratice
//func best_digitize(_ num:Int) -> [Int] {
//    //flatMap함수의 경우 4.1버전 이후에서는 사용하지 않음 2차원에서 1차원으로 flat하게 배열을 1차원으로 정리하고 싶다면 사용하나 1차원에서 1차원은 compactMap 사용
//  return String(num).compactMap { Int(String($0)) }.reversed()
//}
//
//print(best_digitize(testNum))
//
//func checkForFactor(_ base : Int, _ factor: Int) -> Bool {
//    print(base % factor)
//    return base % factor == 1 ? false : true
//}
//
//checkForFactor(653, 7)
//
//
//func expressionMatter(_ a: Int, _ b: Int, _ c: Int) -> Int {
//    var maxNum = a * b * c
//    var crrentNum = a + b + c
//
//  maxNum < crrentNum ? (maxNum = crrentNum) : (crrentNum = (a + b) * c)
//    print(maxNum)
//    maxNum < crrentNum ? (maxNum = crrentNum) : (crrentNum = a * (b + c))
//    print(maxNum)
//  maxNum < crrentNum ? (maxNum = crrentNum) : (crrentNum = a + b * c)
//    print(maxNum)
//  maxNum < crrentNum ? (maxNum = crrentNum) : (crrentNum = a * b + c)
//    print(maxNum)
//
//  return maxNum
//
//}
//
//var test = [1, 2, 3]
//test.reduce(0, +)
//print("asdasdas")
//
//Int("aa") ?? 0
//
//expressionMatter(10, 5, 6)
//
//
//
//
//print("sadasd".contains("sa"))
//
//
//var numbers = [1, 2, 0, 123, -1]
//
//
//
//func take(_ arr: [Int], _ n: Int) -> [Int] {
//    if let i = arr.firstIndex(of: n) {
//        return Array(arr.prefix(i))
//    }
//    return []
//}
//print(take(numbers, 1))
//
//var i = 1
//
//
//var result = 0
//var qwe: [Any] = [1,2,2,3,"4","213"]
//var tttt: [Int]
//
//func sumMix(_ arr: [Any]) -> Int {
//    return arr.reduce(0) {$0 + (Int("\($1)") ?? 0)}
//}
//
//sumMix(qwe)
//
//let aaa = [1,2,3,1,2,1]
//
//aaa.sorted(by: <)
//
//
//print((0..<4).map { $0 % 2 == 0 ? "1" : "0" }.joined())
//
//
//var asddd:[Int] = [1,2,6,12,9,64]
//
//print(asddd.map {Double(Int(sqrt(Double($0)))) == Double($0).squareRoot() ? Int(Double($0).squareRoot()) : $0 * $0})
//
//
//let azq = ["qwe","wqeqweqwe","aaaaa","sad"]
//
//let testSt = """
//1-kiwi
//2-pear
//3-kiwi
//4-banana
//5-melon
//6-banana
//7-melon
//8-pineapple
//9-apple
//10-pineapple
//11-cucumber
//12-pineapple
//13-cucumber
//14-orange
//15-grape
//16-orange
//17-grape
//18-apple
//19-grape
//20-cherry
//21-pear
//22-cherry
//23-pear
//24-kiwi
//25-banana
//26-kiwi
//27-apple
//28-melon
//29-banana
//30-melon
//31-pineapple
//32-melon
//33-pinea
//"""
//
//func resuNum (_ n: Int) -> Int {
//    var origin = n
//    var checkOne = true
//    while origin > 100 || checkOne {
//        origin -= String(origin).reduce(0, {$0 + Int(String($1))!})
//        checkOne = false
//    }
//    return origin
//}
//
//var rrr = ["kiwi","pear","kiwi","banana","melon","banana","melon","pineapple","apple","pineapple","cucumber","pineapple","cucumber","orange","grape","orange","grape","apple","grape","cherry","pear","cherry","pear","kiwi","banana","kiwi","apple","melon","banana","melon","pineapple","melon","pineapple","cucumber","orange","apple","orange","grape","orange","grape","cherry","pear","cherry","pear","apple","pear"]
//
//rrr+=["kiwi","banana","kiwi","banana","melon","pineapple","melon","apple","cucumber","pineapple","cucumber","orange","cucumber","orange","grape","cherry","apple","cherry","pear","cherry","pear","kiwi","pear","kiwi","banana","apple","banana","melon","pineapple","melon","pineapple","cucumber","pineapple","cucumber","apple","grape","orange","grape","cherry","grape","cherry","pear","cherry","apple","kiwi","banana","kiwi","banana","melon","banana","melon","pineapple","apple","pineapple"]
//
//
//rrr[99]
//let asdada = ["sdas","asd","aaaa"]
//
//resuNum(10)



func accum(_ s: String) -> String {
    var result = ""
    var count = 1
    for alph in s {
        for i in 1...count {
            i == 1 ? (result += alph.uppercased()) : (result += alph.lowercased())
        }
        count += 1
        result += "-"
    }
    result.removeLast()
    return result
}

print(accum("aaqQZs"))

var str = "asdasdasd"

print(str.enumerated().map {
    String(repeating: $1, count: $0 + 1)
}.joined(separator: "-"))


for (i, strm) in str.enumerated() {
    print("index : \(i) and str : \(strm)")
}

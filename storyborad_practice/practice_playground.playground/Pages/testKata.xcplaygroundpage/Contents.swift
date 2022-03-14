import Foundation
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



//func accum(_ s: String) -> String {
//    var result = ""
//    var count = 1
//    for alph in s {
//        for i in 1...count {
//            i == 1 ? (result += alph.uppercased()) : (result += alph.lowercased())
//        }
//        count += 1
//        result += "-"
//    }
//    result.removeLast()
//    return result
//}
//
//print(accum("aaqQZs"))
//
//var str = "asdasdasd"
//
//print(str.enumerated().map {
//    String(repeating: $1, count: $0 + 1)
//}.joined(separator: "-"))
//
//
//for (i, strm) in str.enumerated() {
//    print("index : \(i) and str : \(strm)")
//
//
//
//
//}
//
//var testii = [[Int]]()
//
//testii = [[3, 2, 1], [4, 6, 5], [], [9, 7, 8]]
//print(testii.flatMap() {$0}.sorted())
//
//
//func integerChangeString(_ string: String) -> Int {
//    var result: Int = 0
//    var checkSum: Int = 0
//
//    for i in string {
//        if let intre = i.wholeNumberValue {
//            checkSum *= 10
//            checkSum += intre
//            print(checkSum)
//        } else {
//            result += checkSum
//            checkSum = 0
//        }
//    }
//    if checkSum != 0 {result += checkSum}
//    return result
//}




//print(integerChangeString("12.4"))
//
//
//var asd = "asdasd11234-dasd1112"
//print(asd.components(separatedBy: CharacterSet.decimalDigits.inverted).compactMap() {Int($0)}.reduce(0) {$0 + $1})
//
//
//
//var aaaaaaa: Int?
//
//if aaaaaaa == nil {
//    print("check nil")
//}
//
//func find_short(_ str: String) -> Int
//{
//    return str.split(separator: " ").sorted{$0.count < $1.count}[0].count
//}
//
//print(find_short("     a Let's travel abroad shall we"))
//
//"a" == "\u{61}"
//
//(1...1).reduce(0, +)
//
//
//
//func pyramid(_ balls: Int) -> Int{
//    var result = 0
//    var sum = 0
//    while sum < balls {
//        result += 1
//        sum += result
//    }
//    return result
//}
//
//
//
//func descendingOrder(of number: Int) -> Int {
//    var result: Int = 0
//    var num = number
//    var collectNum = [Int]()
//    while num > 0 {
//        collectNum.append(num % 10)
//        num /= 10
//    }
//    guard collectNum.count > 0 else {
//        return 0
//    }
//    collectNum.sort(by: >)
//    for i in collectNum {
//        result *= 10
//        result += i
//    }
//    return result
//}
//descendingOrder(of: 123123411)
//pyramid(4)



//func printerError(_ s: String) -> String {
//    return "\(s.filter {$0 > "m"}.count)/\(s.count)"
//}
//
//
//printerError("aaddqq")
//
//
//let findSomeFirstText = {(name: String, find: String) -> Bool in
//    if name.first?.description == find {
//        return true
//    }
//    return false
//}
//
//
//findSomeFirstText("asdasdasdsadasd", "sd")
//
//
//func extraPerfect(_ n: Int) -> [Int] {
//    return (1...n).filter {$0 % 2 == 1}
//}
//
//
//extraPerfect(21)
//
//
//
//func squareDigits(_ num: Int) -> Int {
//    return Int(num.description.map { Int(pow(Double(String($0))!, 2)).description }.joined()) ?? 0
//}
//
//squareDigits(9119)
//
//
//
//class parent {
//    var test = "test"
//}
//
//class kid : parent {
//    let wqe = "asd"
//}
//
//class kid2 : parent {
//    var sad = "asd"
//}
//
//
//let qq1 = kid()
//let qq2 = kid2()
//
//var qq: [parent] = [qq1, qq2]
//
//qq[1].test
//
//
//func horMirror(_ s: String) -> String {
//    return Array(s.components(separatedBy: "\n").reversed()).map { String($0) }.joined(separator: "\n")
//}
//func vertMirror(_ s: String) -> String {
//    return s.components(separatedBy: "\n").map { String($0.reversed()) }.joined(separator: "\n")
//}
//// replace the dots with function parameter
//func oper(fun : (String) -> String, _ s: String) -> String {
//    return fun(s)
//}
//
//
//print(horMirror("abcd\nefgh\nijkl\nmnop"), vertMirror("abcd\nefgh\nijkl\nmnop"), oper(fun: vertMirror, "abcd\nefgh\nijkl\nmnop"))
//
//
//func specialNumber(_ number: Int) -> String {
//    return number.description.map { $0 <= "5" ? 1 : 0 }.reduce(1, *) == 1 ? "special!" : "NOT!"
//}
//
//
//print(specialNumber(1234556))
//
//var test: Character = "5"
//print(test.asciiValue)
//
//
//func digits(num n: UInt64) -> Int {
//    return n.description.count
//}
//
//print(digits(num: 123456))
//
//
//let pattern = "([0-9]{0,})+5$"
//let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
//
//pred.evaluate(with: "123151235")
//
//
//print((1...5).map { $0.description }.filter { !$0.contains("5") }.count)
//
//func nbDig(_ n: Int, _ d: Int) -> Int {
//  // your code
//    var result = 0
//    let digit: Character = "\(d)".first!
//    let stringAfterFilter = (0...n).map { String($0 * $0) }.filter { $0.contains("\(d)") }
//    for str in stringAfterFilter {
//        for countString in str {
//            if countString == digit { result += 1 }
//        }
//    }
//    return result
//}
//
//print((0...25).map { "\($0 * $0)".filter { $0 == Character("\(1)") }}.flatMap({ $0 }))
//
//func overTheRoad(address: Int, street: Int) -> Int {
//  // Your code goes here
//  return street * 2 - (address - 1)
//}
//
//print(overTheRoad(address: 6, street: 3))
//
//func disariumNumber(_ number: Int) -> String {
//  //Do Some Magic
//    var result: Double = 0
//
//    for (idx, num) in number.description.enumerated() {
//        result += pow(Double(Int(num.description)!), Double(idx + 1))
//    }
//
//  return Int(result) == number ? "Disarium !!" : "Not !!"
//}
//
////정대리 시작한 날 1016
//disariumNumber(222)


//func jumpingNumber(_ number: Int) -> String {
//  //Do Some Magic
//    let numberCount = number.description.count - 1
//    let numbers = number.description.map { $0.wholeNumberValue! }
//    var result = 0
//    for num in 1..<numbers.count {
//        result += abs(numbers[num - 1] - numbers[num]) == 1 ? 1 : 0
//    }
//    return numberCount == result ? "Jumping!!" : "Not!!"
//}
//
//abs(123)
//
//print(jumpingNumber(5656))
//
//func rowSumOddNumbers(_ row: Int) -> Int {
//  var result = 0
//  var startNum = 1
//  var plusNum = 0
//
//  for _ in 1...row {
//    startNum += plusNum
//    plusNum += 2
//  }
//    for _ in 1...row {
//        result += startNum
//        startNum += 2
//    }
//  return result
//}
//
//
//rowSumOddNumbers(2)

func sumOfMinimums(_ numbers: [[Int]]) -> Int {
    var result = 0
    for num in numbers {
        result += num.sorted()[0]
    }
    return result
}
let num = [ [ 1, 2, 3, 4, 5 ] , [ 5, 6, 7, 8, 9 ] , [ 20, 21, 34, 56, 100 ]]

sumOfMinimums(num)



func maskify(_ string:String) -> String {
  guard string.count > 4 else {
    return string
  }
    var result = String(repeating: "#", count: string.count - 5)
    result += string.suffix(4)
    return result
}

func maskify2(_ string:String) -> String {
    return string.enumerated().map { $0 < string.count - 4 ? "#" : "\($1)" }.joined()
}

let asd = "asddd"
maskify2(asd)


func balancedNumber(_ number: Int) -> String {
    guard number > 99 else {
        return "balance"
    }
    let num = number.description.map { $0.wholeNumberValue! }
    let max = num.count % 2 == 1 ? (num.count / 2) : (num.count / 2 - 1)
    let left = num.prefix(max).reduce(0, +)
    let right = num.suffix(max).reduce(0, +)
    
    return left == right ? "blance" : "Not Balance"
}

balancedNumber(92629)

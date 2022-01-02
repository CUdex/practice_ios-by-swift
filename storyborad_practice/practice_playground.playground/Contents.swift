//
//
//
//
//var test = ["test0","test1","test3","test4"]
//
//test.append("test5")
//
//print(test[4])
//
//test.remove(at: 0)
//
//print(test[0])
//
//
//func calScore(scores : [Int]) -> (min: Int, max: Int, sum: Int) {
//    var min: Int = scores[0]
//    var max: Int = scores[0]
//    var sum: Int
//
//    for score in scores {
//        if min > score {
//            min = score
//        } else if score > max {
//            max = score
//        }
//    }
//
//    sum = min + max
//
//    return (min, max, sum)
//}
//
//let listTest: [Int] = [11,12321,2312,11,1515]
//
//let result = calScore(scores: listTest)
//
//print(type(of: result))
//
//
//// class와 struct 차이
//// class는 참조이고 struct는 값이다.
//
//class TestClass {
//    var claInt : Int
//    var claStr : String
//
//    // class는 init이 필수
//    init(intVal: Int, strVal: String) {
//        self.claInt = intVal
//        self.claStr = strVal
//    }
//
//    func printVal() {
//        print("class int는 \(claInt)이고\nclass str은 \(claStr)이다")
//    }
//}
//
//struct TestStruct {
//    var strInt : Int
//    var strStr : String
//
//    func printVal() {
//        print("struct int는 \(strInt)이고\nstruct str은 \(strStr)이다")
//    }
//}
//
//var claObj = TestClass(intVal: 9, strVal: "아홉")
//var strObj = TestStruct(strInt: 9, strStr: "아홉")
//
//claObj.printVal()
//strObj.printVal()
//
//var claObj2 = claObj
//var strObj2 = strObj
//claObj2.claStr = "열"
//claObj2.claInt = 10
//strObj2.strStr = "열"
//strObj2.strInt = 10
//
//print("------fist object------")
//claObj.printVal()
//strObj.printVal()
//print("------second object------")
//claObj2.printVal()
//strObj2.printVal()
//
//// 함수에 함수를 매개변수로 받을 수 있다.
//func hasAnyMatches(number : [Int], condition: (Int) -> Bool) -> Bool {
//    for item in number {
//        if condition(item){
//            return true
//        }
//    }
//    return false
//}
//
//func numBool(number: Int) -> Bool {
//    return number > 10
//}
//
//let num: [Int] = [1, 2, 3, 4, 17, 1, 114]
//let num2: [Int] = [1, 2, 3, 4, 5, 6, 7]
//
//print(hasAnyMatches(number: num, condition: numBool))
//print(hasAnyMatches(number: num2, condition: numBool))
//
//// 클로저 개념
//let testClo = [1, 2, 3, 4, 5]
//let test = testClo.map({(number: Int) -> Int in
//    let result = number + 2
//    return result
//})
//let test1 = testClo.map( {number in number + 2 } )
//let test2 = testClo.map( { $0 + 2 } )
//print(test)
//print(test1)
//print(test2)
//
//let test3 = num.sorted(by: {$0 < $1})
//print(test3)
//
//
//
//
//class Test {
//    var age: Int = 100
//    var name: String
//
//    // init을 통해 인스턴스 생성 시 메소드 및 프로퍼티 수정 가능
//    init(name: String) {
//        self.name = name
//    }
//
//    func simpleTest() {
//        print("안녕하세요 이름은 \(name)이고 나이는 \(age)살 입니다.")
//    }
//}
//
//let test4 = Test(name: "베트맨")
//test4.age = 150
//test4.simpleTest()
//
//class ClaTest {
//    var age: Int = 100
//    var name: String = "슈퍼맨"
//
//    // init을 통해 인스턴스 생성 시 메소드 및 프로퍼티 수정 가능
//    init() {
//        simpleTest()
//    }
//
//    func simpleTest() {
//        print("안녕하세요 이름은 \(name)이고 나이는 \(age)살 입니다.")
//    }
//}
//
//// init을 통해 인스턴스 생성 시 함수 실행
//let cltest = ClaTest()
//
//// 상속을 통해 오버라이딩 가능
//class ClaTest2: ClaTest {
//    override func simpleTest() {
//        // self는 class의 프로퍼티를 의미하며  super는 부모 클래스를 의미
//        let name:String = "그린반지"
//        print("이름은 \(self.name)이고 나이는 \(age)이고 상속받았습니다")
//    }
//}
//let cltest2 = ClaTest2()
//
//// getset을 통해 변수 값 변경
//class GeSeCla {
//    var age:Int = 50
//    var newAge: Int {
//        get {
//            // get을 통해 프로퍼티 값 설정
//            return age * 2
//        }
//        set {
//            // 해당 프로퍼티 값을 받으면 set을 통해 age 값 변경
//            age = newValue * 10
//        }
//    }
//
//    func simpleFunction() {
//        print("나이는 \(age)")
//        print("새로운 나이는 \(newAge)")
//    }
//}
//
//let geSeTest = GeSeCla()
//geSeTest.simpleFunction()
//
//// newAge 변경 시 get set을 통해 프로퍼티 값 변경 100, 200 나이 출력
//geSeTest.newAge = 10
//geSeTest.simpleFunction()
//

// _______________enum and struct

//enum Days: Int {
//    // rawValue 설정
//    case mon = 1
//    case tue, wed, thu, fri, sat, sun
//
//    func testFunction() -> String {
//        // switch문을 통해 열거형 데이터를 활용
//        switch self {
//        case .sat, .sun:
//            return "hoilday"
//        default:
//            return "normal day"
//        }
//    }
//}
//
//let dayTest = Days.sun
//// rawvalue 값 7 출력
//print(dayTest.rawValue)
//// holiday 출력
//print(dayTest.testFunction())
//
//let dayTest2 = Days(rawValue: 1)
//// rawvalue의 경우 nil 값이 올 수 있어 optional로 출력
//// &&의 경우 논리연산자로 let을 통한 optional 언랩핑은 논리연산이 아닌 ","를 이용하여 condition-list형태로 이용
//if let opValue: Int = dayTest2?.rawValue, let opValue2: String = dayTest2?.testFunction() {
//    print(opValue)
//    print(opValue2)
//} else {
//    print("nil값이 존재함")
//}
//
//// struct와 snum 연계
//
//struct StrTest {
//    var Day: Days
//    var name: String
//}
//
//// struct의 데이터 타입에 enum을 활용하여 데이터 처리 가능
//var strTe = StrTest(Day: .fri, name: "test man")
//var test1 = strTe.Day
//// fri 출력
//print(test1)
//var test2 = test1.testFunction()
//// normal day 출력
//print(test2)

// ________________protocols and extensions

// protocol은 반드시 변수와 메소드를 실행시켜야 함 무조건 실행하여야 하는 경우 유용함

//protocol TestProtocol {
//    var simpleValue: String { get }
//    mutating func simpleFunction(name: String) -> String
//}
//
//// 상속이라기 보다는 채택의 개념
//class ProTestCla: TestProtocol {
//    var simpleValue: String = "test"
//
//    func simpleFunction(name: String) -> String {
//        return "this is just \(name) protocol test"
//    }
//}
//
//let test = ProTestCla()
//print(test.simpleValue)
//print(test.simpleFunction(name: "fireTest"))

// __________________extensiton
// 말 그대로 확장의 개념

//protocol TestProtocol {
//    var simpleValue: String { get }
//    mutating func simpleFunction(name: String) -> String
//}
//
//extension Int: TestProtocol {
//    var simpleValue: String {
//        return "extention Int"
//    }
//
//    mutating func simpleFunction(name: String) -> String {
//        return "this is just \(name) extension"
//    }
//}

//// extension을 이용하여 Int형에 기능 추가
//print(5.simpleValue)
//// Intr가 struct이기 때문에 가변 멤버인 mutating func을 사용할 수 없다 필요하다면 class에서 사용
//let test = 5.simpleFunction(name: "int test")
//print(test)


// extenstion을 통해 추가적으로 class에 기능 추가 가능 코드의 가독성에 좋음
//class ClaTest: TestProtocol {
//    var simpleValue: String = "test"
//
//    func simpleFunction(name: String) -> String {
//        return "this is just \(name) extension \(simpleValue)"
//    }
//}
//
//extension ClaTest {
//    func simpleTest2() {
//        print("확장되었다.")
//    }
//}
//
//let test = ClaTest()
//test.simpleValue = "test3"
//print(test.simpleValue)
//print(test.simpleFunction(name: "just test"))
//test.simpleTest2()

// error handling
// protocol type의 error handling이 존재


// enum으로 error 유형 정리
enum ErrorMessage: Error {
    case noInternet
    case noUrl
    case noPhoto
}

func testFunction(test: String) throws -> String {
    if test == "404" {
        throw ErrorMessage.noInternet
    }
    return "정상적으로 \(test) 실행"
}

//// default format do, try, catch
//do {
//    let test = try testFunction(test: "404")
//    print(test)
//} catch {
//    // noInternet 출력
//    print(error)
//}

// simple try
//let test = try? testFunction(test: "404")
//// catch로 따로 설정하지 않아서 nil 값 출력
//print(test)
//
//let test2 = try? testFunction(test: "123")
//if test2 != nil {
//    print(test2!)
//} else {
//    print("error create")
//}

// defer 함수가 실행되기 전 실행되는 함수로 함수의 정상 호출 여부와 상관없이 실행
//
//var fridgeIsOpen: Bool = true
//let listOfFridge: [String] = ["egg", "milk", "leftovers"]
//
//func testDefer(food: String) -> Bool {
//    fridgeIsOpen = true
//    // defer를 통해 food 값이 무엇이든 fridgeIsOpen은 false로 설정됨
//    defer {
//        fridgeIsOpen = false
//    }
//
//    let result = listOfFridge.contains(food)
//    return result
//}
//
//// 함수의 결과와는 상관없이 함수 진행 시 결과 값 고정
//print(testDefer(food: "asd"))
//print(fridgeIsOpen)
//print(testDefer(food: "milk"))
//print(fridgeIsOpen)


// ____________________generic

func swapTwoValue(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var firstNum = 10
var secondNum = 20

print("first number : \(firstNum) | second number : \(secondNum)")

swapTwoValue(&firstNum, &secondNum)

print("first number : \(firstNum) | second number : \(secondNum)")

// generic으로 T을 이용하여 데이터 타입의 제너릭으로 활용

func swapAnyTypeValue<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
var firstStr = "first"
var secondStr = "second"
// 자료형이 맞아야 하지만 제너릭으로 선언된 파라미터로 자료형 제한없이 사용 가능 단, swap되는 변수의 데이터 타입은 동일해야 함
print("first String : \(firstStr) | second String : \(secondStr)")
swapAnyTypeValue(&firstStr, &secondStr)
print("first String : \(firstStr) | second String : \(secondStr)")

print("first number : \(firstNum) | second number : \(secondNum)")
swapAnyTypeValue(&firstNum, &secondNum)
print("first number : \(firstNum) | second number : \(secondNum)")

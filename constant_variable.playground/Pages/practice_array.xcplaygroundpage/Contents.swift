import UIKit

var empArray = Array<String>()
var empArray2 = [String]()

print(empArray.count)

empArray.append("Anna")
empArray.append("Alex")
print(empArray.count)

var testArray = ["dsada", "dasdas", "qq"]
testArray += ["sadasdasdasdas"]

print(testArray)

print("으아 rnlcksdk")

//dictionary

var firstDic = Dictionary<String, Int>()
var secDoc = [String: Int]()

print(firstDic.count)
print(firstDic)

var firstDic2 = ["fir":1, "sec":2, "ser":3]
print(firstDic2["fir"]!)

class Test {
    var testOftest: String {
        return "123"
    }
}

var qwe = Test()
print(type(of: qwe.testOftest))

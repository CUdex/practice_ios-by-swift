//
//  main.swift
//  test
//
//  Created by cudex on 2022/04/09.
//

import Foundation

let A = Int(readLine() ?? "") ?? 0
let B = Int(readLine() ?? "") ?? 0
var temp = B
for _ in 1...3 {
    print(A * (temp % 10))
    temp /= 10
}
print(A * B)


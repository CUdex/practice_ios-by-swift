//
//  main.swift
//  testCommand
//
//  Created by cudex on 2022/03/23.
//

import Foundation


//let string = readLine()!
let num = readLine()!.split(separator: " ").map { Double($0)! }

print(num[0] / num[1])

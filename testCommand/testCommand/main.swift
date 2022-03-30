//
//  main.swift
//  testCommand
//
//  Created by cudex on 2022/03/23.
//

import Foundation

// 거스름돈 문제

func changeMoney(money num: Int) -> Int {
    var money = num
    var result = 0
    let coin = [500, 100, 50, 10]
    
    for won in coin {
        result += money / won
        money %= won
    }
    return result
}

func onlyOne(_ num: Int, _ div: Int) -> Int {
    
    var number = num
    var count = 0
    var target = 0
    
    while true {
        target = (number / div) * div
        count += number - target
        number = target
        if number < div {
            break
        }
        count += 1
        number /= div
    }
    
    count += (number - 1)
    return count
}

print(changeMoney(money: 1260))
print(onlyOne(25, 7))

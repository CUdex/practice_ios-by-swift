//
//  Variables.swift
//  TestrisGame
//
//  Created by 류찬울 on 2022/01/05.
//

import Foundation
import SpriteKit

// 백그라운드 데이터 관리를 위한 struct 생성
struct Variables {
    static var backarrays = [[Int]]()
    static var scene = SKScene()
    
    // 블록 생성
    static var brickValue = Brick().bricks()
    // 초기 블록 생성 기준 위치
    static var dx = 4
    static var dy = 3
    static var gab = 1
    static var startPoint = CGPoint()
    static var brickArrays = Array<CGPoint>()
    static var brickNode = Array<SKSpriteNode>()
    static var blockedArrays = Array<SKSpriteNode>()
}

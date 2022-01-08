//
//  BackGround.swift
//  TestrisGame
//
//  Created by 류찬울 on 2022/01/05.
//

import Foundation
import SpriteKit

class BackGround {
    // 2차원 배열 생성
    let row = 10
    let col = 20
    
    let brickSize = Variables.brickValue.brickSize
    let gab = Variables.gab
    let scene = Variables.scene
    init() {
        // 2차원 배열 초기화
        Variables.backarrays = Array(repeating: Array(repeating: 0, count: row), count: col)
        let xValue = (Int(scene.frame.width) - row * brickSize) + brickSize / 2 - 20
        Variables.startPoint = CGPoint(x: xValue, y: 80)
        bg()
    }
    
    // 백그라운드의 경계 생성
    func bg() {
        for i in 0..<row {
            Variables.backarrays[col-1][i] = 1
            Variables.scene.addChild(wall(x: i, y: col - 1))
            Variables.backarrays[0][i] = 1
            Variables.scene.addChild(wall(x: i, y: 0))
        }
        for i in 0..<col {
            Variables.backarrays[i][0] = 1
            Variables.scene.addChild(wall(x: 0, y: i))
            Variables.backarrays[i][row - 1] = 1
            Variables.scene.addChild(wall(x: row - 1 , y: i))
        }
    }
    
    // 벽 생성 함수
    func wall(x: Int, y: Int) -> SKSpriteNode {
        let brick = SKSpriteNode()
        brick.size = CGSize(width: brickSize - gab, height: brickSize - gab)
        brick.color = .blue
        brick.name = "wall"
        brick.zPosition = 1
        let xValue = x * brickSize + Int(Variables.startPoint.x)
        let yValue = y * brickSize + Int(Variables.startPoint.y)
        brick.position = CGPoint(x: xValue, y: -yValue)
        
        return brick
    }
}

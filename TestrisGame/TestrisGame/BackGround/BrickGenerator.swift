//
//  BrickGenerator.swift
//  TestrisGame
//
//  Created by 류찬울 on 2022/01/07.
//

import Foundation
import SpriteKit

class BrickGenerator {
    // 랜덤으로 블록 생성
    let brickValue = Variables.brickValue
    
    init() {
        Variables.dx = 4
        Variables.dy = 2
        Variables.brickValue = Brick().bricks()
        // 생성된 블록의 x,y 값을 배열로 바인딩
        let brick = brickValue.points
        // 블록 위치 확인
        Variables.brickArrays = brick
        Variables.brickNode.removeAll()
        for item in brick {
            // 블록 위치
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            Variables.backarrays[y][x] = 1
            // 블록 크기 및 색 등 정보 입력
            let xValue = x * brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y * brickValue.brickSize + Int(Variables.startPoint.y)
            let brick = SKSpriteNode()
            brick.color = brickValue.color
            // 간격을 위해 -1 추가
            brick.size = CGSize(width: brickValue.brickSize - Variables.gab, height: brickValue.brickSize - Variables.gab)
            brick.name = brickValue.bricName
            brick.zPosition = brickValue.zPosition
            //
            brick.position = CGPoint(x: xValue, y: -yValue)
            
            Variables.scene.addChild(brick)
            Variables.brickNode.append(brick)
        }
    }
}

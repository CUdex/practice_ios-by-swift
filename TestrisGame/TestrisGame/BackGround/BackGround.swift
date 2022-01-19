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
    let row = Variables.row
    let col = Variables.col
    
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
        
        let bg = SKSpriteNode()
        bg.color = .brown
        bg.size = Variables.scene.frame.size
        bg.position = CGPoint(x: 0, y: 0)
        bg.anchorPoint = CGPoint(x: 0, y: 1)
//        bg.lightingBitMask = 0b001
        for i in 0..<row {
            Variables.backarrays[col-1][i] = 2
        //    Variables.scene.addChild(wall(x: i, y: col - 1))
            Variables.backarrays[0][i] = 2
        //    Variables.scene.addChild(wall(x: i, y: 0))
        }
        for i in 0..<col {
            Variables.backarrays[i][0] = 2
        //    Variables.scene.addChild(wall(x: 0, y: i))
            Variables.backarrays[i][row - 1] = 2
        //    Variables.scene.addChild(wall(x: row - 1 , y: i))
        }
        lines()
    }
    func lines() {
        let leftX = Int(Variables.startPoint.x) + (Variables.brickValue.brickSize / 2)
        let rightX = Variables.brickValue.brickSize * (row - 2) + leftX
        let topY = Int(Variables.startPoint.y) - (Variables.brickValue.brickSize / 2)
        let bottomY = Variables.brickValue.brickSize * (col - 1) + topY
        
        let leftLine = SKSpriteNode()
        leftLine.color = .darkGray
        leftLine.anchorPoint = CGPoint(x: 0.5, y: 1)
        leftLine.size = CGSize(width: 1, height: Variables.brickValue.brickSize * (col - 1))
        leftLine.position = CGPoint(x: leftX, y: -topY)
        Variables.scene.addChild(leftLine)
        
        let rightLine = SKSpriteNode()
        rightLine.color = .darkGray
        rightLine.anchorPoint = CGPoint(x: 0.5, y: 1)
        rightLine.size = CGSize(width: 1, height: Variables.brickValue.brickSize * (col - 1))
        rightLine.position = CGPoint(x: rightX, y: -topY)
        Variables.scene.addChild(rightLine)
        
        let bottomLine = SKSpriteNode()
        bottomLine.color = .darkGray
        bottomLine.anchorPoint = CGPoint(x: 0.5, y: 1)
        bottomLine.size = CGSize(width: rightX - leftX, height: 1)
        bottomLine.position = CGPoint(x: leftX + 150, y: -bottomY)
        Variables.scene.addChild(bottomLine)
        
        let topLine = SKSpriteNode()
        topLine.color = .darkGray
        topLine.anchorPoint = CGPoint(x: 0.5, y: 1)
        topLine.size = CGSize(width: rightX - leftX, height: 1)
        topLine.position = CGPoint(x: leftX + 150, y: -topY)
        Variables.scene.addChild(topLine)
        
        
    }
    
    
    // 벽 생성 함수
//    func wall(x: Int, y: Int) -> SKSpriteNode {
//        let brick = SKSpriteNode()
//        brick.size = CGSize(width: brickSize - gab, height: brickSize - gab)
//        brick.color = .blue
//        brick.name = "wall"
//        brick.zPosition = 1
//        let xValue = x * brickSize + Int(Variables.startPoint.x)
//        let yValue = y * brickSize + Int(Variables.startPoint.y)
//        brick.position = CGPoint(x: xValue, y: -yValue)
//
//        return brick
//    }
}

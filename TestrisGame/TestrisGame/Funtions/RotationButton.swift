//
//  RotationButton.swift
//  TestrisGame
//
//  Created by 류찬울 on 2022/01/08.
//

import Foundation
import SpriteKit

class RotationButton {
    
    let btn = SKSpriteNode()
    
    init() {
        // 버튼 초기화
        btn.texture = SKTexture(imageNamed: "rotaion_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "rotation"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width) / 2 , y: -Int(Variables.scene.frame.height) + 50)
        
        Variables.scene.addChild(btn)
    }
    
    // 버튼 회전 기능
    func brickRotation() {
        if isCheckRotatable() {
            let sinX = CGFloat(1)
            let cosX = CGFloat(0)
            var rotatedBrick = Array<CGPoint>()
            var action = SKAction()
            for (i, item) in Variables.brickArrays.enumerated() {
                let r = item.y
                let c = item.x
                let currentY = Int(item.y) + Variables.dy
                let currentX = Int(item.x) + Variables.dx
                Variables.backarrays[currentY][currentX] -= 1
                
                let newBrickX = (c * cosX) - (r * sinX)
                let newBrickY = (c * sinX) + (r * cosX)
                rotatedBrick.append(CGPoint(x: newBrickX, y: newBrickY))
                
                let newX = Int(newBrickX) + Variables.dx
                let newY = Int(newBrickY) + Variables.dy
                Variables.backarrays[newY][newX] += 1
                
                // 화면 이동
                let xValue = Int(newX) * Variables.brickValue.brickSize + Int(Variables.startPoint.x)
                let yValue = Int(newY) * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
                action = SKAction.move(to: CGPoint(x: xValue, y: -yValue), duration: 0.1)
                Variables.brickNode[i].run(action)
            }
            Variables.brickArrays = rotatedBrick
        }
        for item in Variables.backarrays {
            print(item)
        }
    }
    
    // 버튼 회전 가능 체크
    func isCheckRotatable() -> Bool {
        return true
    }
}

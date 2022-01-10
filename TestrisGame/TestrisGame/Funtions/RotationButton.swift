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
    
    func anim() {
        var textures = Array<SKTexture>()
        for i in 1...15 {
            let name = "rotaion_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.3)
        btn.run(action)
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
                action = SKAction.move(to: CGPoint(x: xValue, y: -yValue), duration: 0.03)
                Variables.brickNode[i].run(action)
            }
            Variables.brickArrays = rotatedBrick
            anim()
        }
        for item in Variables.backarrays {
            print(item)
        }
    }
    
    // 버튼 회전 가능 체크
    func isCheckRotatable() -> Bool {
        let sinX = CGFloat(1)
        let cosX = CGFloat(0)
        for item in Variables.brickArrays {
            if item.x != 0 || item.y != 0 {
                let r = item.y
                let c = item.x
                let x = Int(c * cosX) - Int(r * sinX) + Variables.dx
                let y = Int(c * sinX) + Int(r * cosX) + Variables.dy
                if Variables.backarrays[y][x] == 2 {
                    return false
                }
            }
        }
        return true
    }
}

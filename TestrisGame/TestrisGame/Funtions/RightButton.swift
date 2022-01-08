//
//  RightButton.swift
//  TestrisGame
//
//  Created by 류찬울 on 2022/01/08.
//

import Foundation
import SpriteKit

class RightButton {
    let btn = SKSpriteNode()
    
    init() {
        // 버튼 초기화
        btn.texture = SKTexture(imageNamed: "right_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "right"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width) - 50, y: -Int(Variables.scene.frame.height) + 50)
        
        Variables.scene.addChild(btn)
    }
    
    func anim() {
        var textures = Array<SKTexture>()
        for i in 1...15 {
            let name = "right_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
    
    func brickMoveRight() {
        if isMovale() {
            Variables.dx += 1
            var action = SKAction()
            for (i, item) in Variables.brickArrays.enumerated() {
                let x = Int(item.x) + Variables.dx
                let y = Int(item.y) + Variables.dy
                
                // 기존 위치 초기화
                Variables.backarrays[y][x - 1] -= 1
                // 이동 위치에 블록 생성
                Variables.backarrays[y][x] += 1
                action = SKAction.moveBy(x: CGFloat(Variables.brickValue.brickSize), y: 0, duration: 0.1)
                anim()
                Variables.brickNode[i].run(action)
            }
        }
    }
    
    func isMovale() -> Bool {
        // 최우측 포인트 찾기
        var right = Variables.brickArrays[0]
        for i in Variables.brickArrays {
            if right.x < i.x {
                right = i
            }
        }
        
        let xValue = Int(right.x) + Variables.dx + 1
        // 우측 값이 0인지 1인지 체크
        if Variables.backarrays[Variables.dy][xValue] != 0 {
            return false
        }else {
            return true
        }
    }
}

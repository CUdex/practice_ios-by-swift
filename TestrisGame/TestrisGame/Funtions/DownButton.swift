//
//  DownButton.swift
//  TestrisGame
//
//  Created by 류찬울 on 2022/01/10.
//

import Foundation
import SpriteKit

class DownButton {
    
    let btn = SKSpriteNode()
    
    init() {
        // 버튼 초기화
        btn.texture = SKTexture(imageNamed: "down_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "down"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width) / 2 - 50, y: -Int(Variables.scene.frame.height) + 50)
        
        Variables.scene.addChild(btn)
    }
    
    func brickDown() {
        if isBrickDownable() {
            possibleDown()
        } else {
            impossibleDown()
        }
        
        anim()
    }
    // 블록인 내려갈수 있는 경우
    func possibleDown() {
        
        // 블록의 열을 추가
        Variables.dy += 1
        var action = SKAction()
        for (i, item) in Variables.brickArrays.enumerated() {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            // 기존 블럭 위치 초기화
            Variables.backarrays[y - 1][x] -= 1
            Variables.backarrays[y][x] += 1
            // 블록 모양만큼 이동
            action = SKAction.moveBy(x: 0, y: -CGFloat(Variables.brickValue.brickSize), duration: 0.1)
            Variables.brickNode[i].run(action)
        }
        
    }
    // 블록이 내려갈 수 없는 경우
    func impossibleDown() {
        
    }
    
    func isBrickDownable() -> Bool {
        
        // 벽 확인
        for item in Variables.brickArrays {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            if Variables.backarrays[y + 1][x] == 2{
                return false
            }
        }
        return true
    }
    
    func anim() {
        var textures = Array<SKTexture>()
        for i in 1...15 {
            let name = "down_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
        
    }
}

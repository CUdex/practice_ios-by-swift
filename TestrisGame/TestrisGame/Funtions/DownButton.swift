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
        // 블록 값을 2로 변경
        for item in Variables.brickArrays {
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            Variables.backarrays[y][x] = 2
            
            // 새로운 블록 생성하여 배열 입력
            let blocked = SKSpriteNode()
            blocked.color = .gray
            blocked.size = CGSize(width: Variables.brickValue.brickSize - Variables.gab, height: Variables.brickValue.brickSize - Variables.gab)
            blocked.name = "blocked"
            let xValue = x * Variables.brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            blocked.position = CGPoint(x: xValue, y: -yValue)
            Variables.scene.addChild(blocked)
            Variables.blockedArrays.append(blocked)
        }
        // 기존 블럭 삭제
        for item in Variables.brickNode {
            item.removeFromParent()
        }
        checkDelete()
    }
    
    func checkDelete() {
        // 블록에서 중복된 y 값을 제거
        var set = Set<Int>()
        for item in Variables.brickArrays {
            let y = Int(item.y) + Variables.dy
            set.insert(y)
        }
        // 가져온 y 값으로 행 체크
        for y in set.sorted(){
            let yValue = y * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            // 체크한 행에 0이 포함되어 있는지 확인
            if !Variables.backarrays[y].contains(0) {
                Variables.backarrays.remove(at: y)
                Variables.backarrays.insert([2,0,0,0,0,0,0,0,0,2], at: 1)
                
                //삭제 효과음
                Variables.blockedArrays.first?.run(SKAction.playSoundFileNamed("delete.wav", waitForCompletion: false))
                // 삭제 효과 emitter
                fire(position: CGPoint(x: Int(Variables.scene.frame.width) / 2, y: -yValue))
                
                for item in Variables.blockedArrays{
                    // 같은 라인에 있는 경우
                    if Int(item.position.y) == -yValue{
                        if let removeItem = Variables.blockedArrays.firstIndex(of: item){
                            Variables.blockedArrays.remove(at: removeItem)
                            var action = SKAction()
                            action = SKAction.fadeOut(withDuration: 0.1)
                            item.run(action){
                                // 액션이 끝난 후 행위
                                item.removeFromParent()
                            }
                        }
                    }
                    // 현재 라인보다 위에 블록이 있는 경우
                    if Int(item.position.y) > -yValue{
                        var action = SKAction()
                        action = SKAction.moveBy(x: 0, y: -CGFloat(Variables.brickValue.brickSize), duration: 0.5)
                        item.run(action)
                    }
                }
            }
        }
        if isGameOver(deadLine: Variables.dy){
            // 블럭 새로 생성
            NextBrick().nextBrickMoveLeft()
            _ = BrickGenerator()
        }
        
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
    
    func isGameOver(deadLine: Int) -> Bool{
        if deadLine > 2 {
            return true
        }
        else {
            if let scene = GameOver(fileNamed: "GameOver") {
                let transition = SKTransition.moveIn(with: .right, duration: 1)
                Variables.scene.view?.presentScene(scene, transition: transition)
            }
            return false
        }
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
    func fire(position: CGPoint){
        let fire = SKEmitterNode(fileNamed: "Fire.sks")
        fire?.particlePosition = position
        fire?.particlePositionRange = CGVector(dx: Int(Variables.scene.frame.width) - Variables.brickValue.brickSize * 2, dy: Variables.brickValue.brickSize)
        Variables.scene.addChild(fire!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            fire?.removeFromParent()
        }
    }
}

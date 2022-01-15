//
//  GameScene.swift
//  TestrisGame
//
//  Created by 류찬울 on 2022/01/05.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var leftButton: LeftButton?
    var rightButton: RightButton?
    var rotationButton: RotationButton?
    var downButton: DownButton?
    var stopButton: StopButton?
    var updateTime = 0.0
    
    override func didMove(to view: SKView) {
        Variables.scene = self
        // background 인스턴스 생성
        _ = BackGround()
        _ = BrickGenerator()
        // 화면에 버튼 인스턴스 생성
        leftButton = LeftButton()
        rightButton = RightButton()
        rotationButton = RotationButton()
        downButton = DownButton()
        stopButton = StopButton()
        checkBrick()
    }
    
    // 위치 배열 생성
    func checkBrick() {
        let arrays = Variables.backarrays
        for item in arrays{
            print(item)
        }
    }
    override func update(_ currentTime: TimeInterval) {
        if updateTime == 0 {
            updateTime = currentTime
        }
        if currentTime - updateTime > 1 {
            updateTime = currentTime
            if !Variables.isPouse {
                downButton?.brickDown()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location!)
        for item in node {
            if item.name == "left" {
                leftButton?.brickMoveLeft()
            } else if item.name == "right" {
                rightButton?.brickMoveRight()
            } else if item.name == "rotation" {
                rotationButton?.brickRotation()
            } else if item.name == "down" {
                while (downButton?.isBrickDownable())! {
                    downButton?.brickDown()
                }
            } else if item.name == "stop" {
                stopButton?.brickStop()
            }
        }
    }
    

}

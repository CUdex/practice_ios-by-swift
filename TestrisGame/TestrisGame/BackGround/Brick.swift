//
//  Brick.swift
//  TestrisGame
//
//  Created by 류찬울 on 2022/01/05.
//

import Foundation
import SpriteKit

class Brick {
    
    // 블록이 가지고 있는 속성 정의
    struct Bricks {
        // 블록 컬러
        var color = UIColor()
        // 블록 모양을 정의할 배열
        var points = Array<CGPoint>()
        // 기본 사이즈
        let brickSize = 33
        // 포지션
        let zPosition = CGFloat(1)
        // 구분을 위한 이름 정의
        var bricName = String()
    }
    
    func bricks() -> Bricks {
        // 블록 배열 생성
        var bricks = [Bricks]()
        
        // 블록 모양 생성
        var brick1 = [CGPoint]()
        brick1.append(CGPoint(x: 0, y: 0))
        brick1.append(CGPoint(x: 1, y: 0))
        brick1.append(CGPoint(x: -1, y: 0))
        brick1.append(CGPoint(x: 0, y: -1))
        // 블록 종류 추가
        bricks.append(Bricks(color: .red, points: brick1, bricName: "brick1"))
        
        var brick2 = [CGPoint]()
        brick2.append(CGPoint(x: -1, y: 0))
        brick2.append(CGPoint(x: 0, y: 0))
        brick2.append(CGPoint(x: 1, y: 0))
        brick2.append(CGPoint(x: 2, y: 0))
        bricks.append(Bricks(color: .blue, points: brick2, bricName: "brick2"))
        
        var brick3 = [CGPoint]()
        brick3.append(CGPoint(x: -1, y: 0))
        brick3.append(CGPoint(x: 0, y: 0))
        brick3.append(CGPoint(x: 1, y: 0))
        brick3.append(CGPoint(x: -1, y: 1))
        bricks.append(Bricks(color: .yellow, points: brick3, bricName: "brick3"))
        
        var brick4 = [CGPoint]()
        brick4.append(CGPoint(x: -1, y: 0))
        brick4.append(CGPoint(x: 0, y: 0))
        brick4.append(CGPoint(x: -1, y: 1))
        brick4.append(CGPoint(x: 0, y: 1))
        bricks.append(Bricks(color: .cyan, points: brick4, bricName: "brick4"))
        
        var brick5 = [CGPoint]()
        brick5.append(CGPoint(x: -1, y: 0))
        brick5.append(CGPoint(x: 0, y: 0))
        brick5.append(CGPoint(x: 0, y: 1))
        brick5.append(CGPoint(x: -1, y: 1))
        bricks.append(Bricks(color: .brown, points: brick5, bricName: "brick5"))
        
        var brick6 = [CGPoint]()
        brick6.append(CGPoint(x: -1, y: 0))
        brick6.append(CGPoint(x: 0, y: 0))
        brick6.append(CGPoint(x: 1, y: 0))
        brick6.append(CGPoint(x: 1, y: 1))
        bricks.append(Bricks(color: .orange, points: brick6, bricName: "brick6"))
        
        var brick7 = [CGPoint]()
        brick7.append(CGPoint(x: -1, y: 0))
        brick7.append(CGPoint(x: 0, y: 0))
        brick7.append(CGPoint(x: 0, y: 1))
        brick7.append(CGPoint(x: 1, y: 1))
        bricks.append(Bricks(color: .systemPink, points: brick7, bricName: "brick7"))
        
        let random = Int.random(in: 0..<7)
        return bricks[random]
    }
    
}

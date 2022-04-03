//
//  DraggableView.swift
//  PanGesturePracticeApp
//
//  Created by cudex on 2022/04/03.
//

import Foundation
import UIKit

// 뷰 생성
class DraggableView: UIView {
    
    var dragType = DragType.none
    var segmentMaxY: CGFloat = 50
    
    init() {
        // UIView의 경우 부모 클래스의 init설정이 필요함
        super.init(frame: CGRect.zero)
        
        // View가 드래그가 가능하도록 설정
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
        
        // 객체 상태에 따라 코드 진행
        switch pan.state {
        case .began :
            print("begin")
            
        // 객체가 움직이면 실행
        case .changed :
            // 부모 뷰를 기준으로 뷰의 움직이는 값을 가져올 수 있다.
            let delta = pan.translation(in: self.superview)
            // 뷰의 지금 위치에서 절대 좌표를 통해 위치 값 가져올 수 있다.
            var myPosition = self.center
            // 변경된 포지션 값으로 center의 기준 위치 변경
            print(self.frame.maxY)
            if dragType == DragType.typeX {
                myPosition.x += delta.x
            } else if dragType == DragType.typeY {
                myPosition.y += delta.y
            } else {
                myPosition.x += delta.x
                myPosition.y += delta.y
            }
            
            
            self.center = myPosition
            // 움직인 값을 다시 초기화
            pan.setTranslation(CGPoint.zero, in: self.superview)
        // 화면이 넘어갈 경우 제약을 설정
        case .ended,.cancelled :
            print("ended cancelled")
            // 값 호출은 minX 세팅은 origin.x 사용
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
                }
            }
            if self.frame.minY < segmentMaxY {
                self.frame.origin.y = segmentMaxY
            }
            if let hasSuperView = self.superview {
                if self.frame.maxY > hasSuperView.frame.maxY {
                    self.frame.origin.y = hasSuperView.frame.maxY - self.bounds.height
                }
            }
            
        default:
            break
        }
        
    }
    
}

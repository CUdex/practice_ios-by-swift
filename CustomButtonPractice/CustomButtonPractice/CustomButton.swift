//
//  CustomButton.swift
//  CustomButtonPractice
//
//  Created by cudex on 2022/04/23.
//

import UIKit

enum RotateType {
    case Up
    case Down
}

class CustomButton: UIButton {
    
    //configure 무조건 호출하도록 설정
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    
    // storyboard로 실행 시 이 init이 실행됨
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // var isOpened = false
    var isUp = RotateType.Up {
        didSet {
            changeDesign()
        }
    }
    
    // 버튼 사용 상태 확인 클로저
    var selectTypeCallback: (RotateType) -> Void = { _ in }
    
    private func configure() {
        self.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
    }
    
    @objc private func selectButton() {
        if isUp == .Up {
            isUp = .Down
        } else {
            isUp = .Up
        }
        
        selectTypeCallback(isUp)
    }

    func changeDesign() {
//        // Bool을 이용한 rotate
//        if isOpened {
//            // image 180도 회전
//            self.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
//
//        } else {
//            // transform 설정 전 원복
//            self.imageView?.transform = .identity
//        }
        UIView.animate(withDuration: 0.25) {
            if self.isUp == .Down {
                // image 180도 회전
                self.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
                // alpha value change
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.3)
            } else {
                // transform 설정 전 원복
                self.imageView?.transform = .identity
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
            }
        }
        
    }
}
 

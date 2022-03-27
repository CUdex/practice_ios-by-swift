//
//  ViewController.swift
//  DispatchQueuePracticeApp
//
//  Created by cudex on 2022/03/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLable: UILabel!
    @IBOutlet weak var finishLable: UILabel!
    @IBOutlet weak var testLable: UILabel!
    
    // dispatch queue 확인
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
            // 1970년부터 타임 인터벌 값을 표시
            self.timerLable.text = Date().timeIntervalSince1970.description
        })
        
        DispatchQueue.main.async {
            for _ in 1..<10 {
                Thread.sleep(forTimeInterval: 0.5)
                self.testLable.text = "끝1"
            }
        }
        testLable.text = "끝2"
    }

    @IBAction func action1(_ sender: Any) {
        // 기본적으로 main 쓰레드에서 진행
        // finishLable.text = "end"
        
        simpleClosure {
            self.finishLable.text = "end"
        }
    }
    
    func simpleClosure(completion: @escaping () -> Void) {
        
        
        // Dispatch를 이용하여 다른 쓰레드를 이용
        DispatchQueue.global().async {
            for index in 0..<10 {
                // Thread를 조정하는 함수
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
            
            // main 쓰레드 사용
            // 화면에 대한 갱신은 main Thread에서만 사용 가능
            DispatchQueue.main.async {
                completion()
            }
            
        }
    }
    
    
    @IBAction func action2(_ sender: Any) {
        
        // Thread 그룹
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        let queue4 = DispatchQueue(label: "q4")
        
        queue1.async(group: dispatchGroup, qos: .background) {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        queue2.async(group: dispatchGroup, qos: .userInteractive) {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        queue3.async(group: dispatchGroup) {
            // 다른 쓰레드 사용으로 그룹 notify 사용 시 그룹에서 해당 쓰레드는 바로 작업 종료로 판단됨
            DispatchQueue.global().async {
                for index in 20..<30 {
                    Thread.sleep(forTimeInterval: 0.5)
                    print(index)
                }
            }
        }
        queue4.async(group: dispatchGroup) {
            // 해당 쓰레드 수동 작업 시작
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 30..<40 {
                    Thread.sleep(forTimeInterval: 0.7)
                    print(index)
                }
                // 해당 쓰레드 수동 작업 종료
                dispatchGroup.leave()
            }
        }
        // 해당 dispatch group에 Thread에 모든 작업이 완료되면 동작
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("End!")
        }
    }
    
    @IBAction func action3(_ sender: Any) {
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        // sync는 다른 쓰레드까지 멈추고 자신을 우선 작업한다.
        queue1.sync {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
            
            //deadlock -> 상대작업이 끝날때까지 서로 대기하는 상태
//            queue1.sync {
//                for index in 0..<10 {
//                    Thread.sleep(forTimeInterval: 0.2)
//                    print(index)
//                }
//            }
        }
        queue2.sync {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
    }
    
}


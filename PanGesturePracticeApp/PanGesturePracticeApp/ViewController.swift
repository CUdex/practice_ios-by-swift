//
//  ViewController.swift
//  PanGesturePracticeApp
//
//  Created by cudex on 2022/04/02.
//

import UIKit

enum DragType {
    case typeX
    case typeY
    case none
}

class ViewController: UIViewController {

    var dragType = DragType.none
    let myView = DraggableView()
    @IBOutlet weak var segmentButton: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.segmentMaxY = segmentButton.frame.maxY
        myView.center = self.view.center
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.backgroundColor = .red
        myView.dragType = DragType.typeX
        self.view.addSubview(myView)
        self.view.sendSubviewToBack(myView)
    }
    
    @IBAction func selectPanType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0 :
            dragType = DragType.typeX
        case 1 :
            dragType = DragType.typeY
        case 2 :
            dragType = DragType.none
        default :
            break
        }
        
        myView.dragType = self.dragType
    }
    


}


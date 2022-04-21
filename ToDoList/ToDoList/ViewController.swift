//
//  ViewController.swift
//  ToDoList
//
//  Created by cudex on 2022/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toDotableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // 타이틀 수정
        self.title = "To Do List"
        
        makeNavigationBar()
        
        toDotableView.delegate = self
        toDotableView.dataSource = self
    }
    
    func makeNavigationBar() {
        // bar button implement
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        // color
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        
        // navigation background color
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(displayP3Red: 30/255, green: 40/255, blue: 50/255, alpha: 0.3)
        self.navigationController?.navigationBar.standardAppearance = barAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
    }

    // button클릭 시 실행되는 액션
    @objc func addNewTodo() {
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellTableViewCell", for: indexPath)
        
        return cell
    }
    
    
}

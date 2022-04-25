//
//  ViewController.swift
//  ToDoList
//
//  Created by cudex on 2022/04/21.
//

import UIKit
import CoreData


// priority level에 따른 설정
enum PriorityLevel: Int64 {
    case level1
    case level2
    case level3
}

extension PriorityLevel {
    var color: UIColor {
        switch self {
        case .level1:
            return .green
        case .level2:
            return .blue
        case .level3:
            return .brown
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var toDotableView: UITableView!
    
    //AppDelegate 접근
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    var todoList = [ToDoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // 타이틀 수정
        self.title = "To Do List"
        
        makeNavigationBar()
        
        toDotableView.delegate = self
        toDotableView.dataSource = self
        fetchData()
        toDotableView.reloadData()
    }
    
    func fetchData() {
        // 접근할 entity를 이용하기 위해 설정
        let fetchReqeust: NSFetchRequest<ToDoList> = ToDoList.fetchRequest()
        //appdelegate를 통해 db 접근
        let context = appdelegate.persistentContainer.viewContext
        
        
        do {
            self.todoList = try context.fetch(fetchReqeust)
        }catch {
            print(error)
        }
        
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
        let detailVC = ToDoDetailViewController.init(nibName: "ToDoDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellTableViewCell", for: indexPath) as! ToDoCellTableViewCell
        
        cell.topTitle.text = todoList[indexPath.row].title
        if let hasDate = todoList[indexPath.row].date {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd hh:mm:ss"
            let dateString = formatter.string(from: hasDate)
            cell.subLable.text = dateString
        } else {
            cell.subLable.text = ""
        }
        
        // 컬러 설정
        let priority = todoList[indexPath.row].priorityLevel
        let priorityColor = PriorityLevel(rawValue: priority)?.color
        cell.priorityView.backgroundColor = priorityColor
        cell.priorityView.layer.cornerRadius = cell.priorityView.bounds.height / 2
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = ToDoDetailViewController.init(nibName: "ToDoDetailViewController", bundle: nil)
        detailVC.delegate = self
        detailVC.selectToDoList = todoList[indexPath.row]
        self.present(detailVC, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension ViewController: TodoDetailViewControllerDelegate {
    func didFinishSaveData() {
        self.fetchData()
        self.toDotableView.reloadData()
    }
}

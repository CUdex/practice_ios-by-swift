//
//  ToDoDetailViewController.swift
//  ToDoList
//
//  Created by cudex on 2022/04/22.
//

import UIKit
import CoreData

// 화면 갱신에 필요한 delegate 생성
protocol TodoDetailViewControllerDelegate: AnyObject {
    func didFinishSaveData()
}

class ToDoDetailViewController: UIViewController {

    @IBOutlet weak var textTitleField: UITextField!
    
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate: TodoDetailViewControllerDelegate?
    
    var selectToDoList: ToDoList?
    
    var priority: PriorityLevel?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //button radius setting
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = normalButton.bounds.height / 2
        highButton.layer.cornerRadius = highButton.bounds.height / 2
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let hasData = selectToDoList {
            textTitleField.text = hasData.title
            
            priority = PriorityLevel(rawValue: hasData.priorityLevel)
            MakePriorityButtonDesign()
            
            saveButton.setTitle("Update", for: .normal)
            deleteButton.isHidden = false
        } else {
            saveButton.setTitle("Save", for: .normal)
            deleteButton.isHidden = true
        }
    }

    // 버튼 액션 태그 설정 선행 필요
    @IBAction func setPriority(_ sender: UIButton) {
        
        //눌린 버튼의 태그에 따라 처리
        switch sender.tag {
        case 1:
            priority = .level1
        case 2:
            priority = .level2
        case 3:
            priority = .level3
        default:
            break
        }
        
        MakePriorityButtonDesign()
        
    }
    
    func MakePriorityButtonDesign() {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear
        
        switch self.priority {
        case .level1:
            lowButton.backgroundColor = priority?.color
        case .level2:
            normalButton.backgroundColor = priority?.color
        case .level3:
            highButton.backgroundColor = priority?.color
        default:
            break
        }
    }
    
    // ToDoList entity에 저장
    @IBAction func saveButton(_ sender: UIButton) {
        
        if selectToDoList != nil {
            updateToDoList()
        } else {
            saveToDo()
        }

        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveToDo() {
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "ToDoList", in: context) else {return}
        
        // key value형태로 데이터를 가져오기
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? ToDoList else {return}
        
        object.title = textTitleField.text
        // 저장하는 순간의 날짜
        object.date = Date()
        // UUID 설정
        object.uuid = UUID()
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.saveContext()
        
        object.priorityLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
    }
    
    func updateToDoList() {
        
        guard let hasData = selectToDoList else {
            return
        }
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        // entity에서 데이터 가져오기
        let fetchRequest: NSFetchRequest<ToDoList> = ToDoList.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            let loadedDate = try context.fetch(fetchRequest)
            
            loadedDate.first?.title = textTitleField.text
            loadedDate.first?.date = Date()
            loadedDate.first?.priorityLevel = self.priority?.rawValue ?? PriorityLevel.level1.rawValue
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.saveContext()
        }catch {
            print(error)
        }
    }
    
    @IBAction func deleteDate(_ sender: UIButton) {
        guard let hasData = selectToDoList else {
            return
        }
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        let fetchRequest: NSFetchRequest<ToDoList> = ToDoList.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            let loadData = try context.fetch(fetchRequest)
            if let deleteWillDate = loadData.first {
                context.delete(deleteWillDate)
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                appdelegate.saveContext()
                delegate?.didFinishSaveData()
            }
        }catch {
            print(error)
        }
        self.dismiss(animated: true, completion: nil)
    }

}

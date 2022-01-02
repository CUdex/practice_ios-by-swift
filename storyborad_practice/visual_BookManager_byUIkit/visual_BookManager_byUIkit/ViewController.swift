//
//  ViewController.swift
//  visual_BookManager_byUIkit
//
//  Created by 류찬울 on 2021/12/27.
//

import UIKit

class ViewController: UIViewController {
    
    var myBookManger = BookManager()
    
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let books1 = Book(name: "초코송이", gerne: "초코초코", author: "오리온 초코")
        let books2 = Book(name: "초코송이2", gerne: "초코초코2", author: "오리온 초코2")
        let books3 = Book(name: "초코송이3", gerne: "초코초코3", author: "오리온 초코3")

        myBookManger.registerBook(objectBook: books1)
        myBookManger.registerBook(objectBook: books2)
        myBookManger.registerBook(objectBook: books3)
        countLabel.text = "\(myBookManger.countBooks())"
    }
    
    @IBAction func registerAction(_ sender:Any) {
        var bookTemp = Book()
        
        bookTemp.name = nameTextField.text!
        bookTemp.author = authorTextField.text!
        bookTemp.gerne = genreTextField.text!
        
        myBookManger.registerBook(objectBook: bookTemp)
        outputTextView.text = "\(nameTextField.text!) has been registerd"
        countLabel.text = "\(myBookManger.countBooks())"
    }
    
    @IBAction func searchAction(_ sender: Any) {
        let resultBook = myBookManger.searchBooks(name: nameTextField.text!)
        if resultBook != nil {
            outputTextView.text = resultBook
        } else {
            outputTextView.text = "we don't have book that you search"
        }
    }
    
    @IBAction func removeAction(_ sender: Any) {
        myBookManger.removeBook(name: nameTextField.text!)
        outputTextView.text = "\(nameTextField.text!) removed"
        countLabel.text = "\(myBookManger.countBooks())"
    }
    
    @IBAction func showAllBookAction(_ sender: Any) {
//        print("")
        var bookViewList: String = ""
        for books in myBookManger.bookList {
            bookViewList += "\(books.name!)\n"
            bookViewList += "\(books.author!)\n"
            bookViewList += "\(books.gerne!)\n"
            bookViewList += "-----------\n"
        }
        
        outputTextView.text = "\(bookViewList)"
    }


}


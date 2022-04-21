//
//  ToDoCellTableViewCell.swift
//  ToDoList
//
//  Created by cudex on 2022/04/21.
//

import UIKit

class ToDoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var subLable: UILabel!
    @IBOutlet weak var priorityView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

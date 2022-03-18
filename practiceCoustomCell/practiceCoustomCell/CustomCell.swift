//
//  CustomCell.swift
//  practiceCoustomCell
//
//  Created by cudex on 2022/03/17.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var amountLable: UILabel!
    @IBOutlet weak var valueLable: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        //Nib 파일이 읽어지면 호출되는 함수
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

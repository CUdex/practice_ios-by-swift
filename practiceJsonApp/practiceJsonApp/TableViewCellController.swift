//
//  TableViewCellController.swift
//  practiceJsonApp
//
//  Created by cudex on 2022/03/25.
//

import UIKit

class TableViewCellController: UITableViewCell {
    
    
    @IBOutlet weak var countryLable: UILabel!
    @IBOutlet weak var weatherLable: UILabel!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  ProfileCell.swift
//  practiceSettingApp
//
//  Created by cudex on 2022/03/29.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitle: UILabel!
    
    @IBOutlet weak var bottomDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // image를 둥글게
        let profileHeigth: CGFloat = 60
        profileImageView.layer.cornerRadius = profileHeigth / 2
        
        // title font
        topTitle.textColor = .blue
        topTitle.font = UIFont.systemFont(ofSize: 20)
        
        // description
        bottomDescription.textColor = .darkGray
        bottomDescription.font = UIFont.systemFont(ofSize: 16)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  MovieCell.swift
//  MovieApp
//
//  Created by cudex on 2022/04/10.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel! {
        didSet {
            titleLable.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    @IBOutlet weak var dataLable: UILabel! {
        didSet {
            dataLable.font = .systemFont(ofSize: 13, weight: .light)
        }
    }
    @IBOutlet weak var descriptionLable: UILabel! {
        didSet {
            descriptionLable.font = .systemFont(ofSize: 16, weight: .light)
        }
    }
    @IBOutlet weak var priceLable: UILabel! {
        didSet {
            priceLable.font = .systemFont(ofSize: 14, weight: .bold)
        }
    }
    @IBOutlet weak var Movieimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

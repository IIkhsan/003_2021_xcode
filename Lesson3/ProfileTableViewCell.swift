//
//  ProfileTableViewCell.swift
//  Lesson3
//
//  Created by Алексей Горбунов on 27.09.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

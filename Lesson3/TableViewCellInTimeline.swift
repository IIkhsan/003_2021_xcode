//
//  TableViewCellInTimeline.swift
//  Lesson3
//
//  Created by Милана Махсотова on 26.09.2021.
//

import UIKit

class TableViewCellInTimeline: UITableViewCell {
    @IBOutlet weak var textPost: UITextView!
    @IBOutlet weak var nicknameAuthor: UILabel!
    
    @IBOutlet weak var photoAuthor: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

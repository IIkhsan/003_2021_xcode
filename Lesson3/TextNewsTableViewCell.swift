//
//  TextNewsTableViewCell.swift
//  Lesson3
//
//  Created by Alina Bikkinina on 27.09.2021.
//

protocol NewsCell: UITableViewCell {}

import UIKit

class TextNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupTitleLabel: UILabel!
    
    @IBOutlet weak var groupImageView: UIImageView!
    
    @IBOutlet weak var postTimeLabel: UILabel!
    
    @IBOutlet weak var postTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData (postInfo: News) -> Void {
        groupTitleLabel.text = postInfo.groupTitle
        groupImageView.image = postInfo.groupImg
        postTimeLabel.text = postInfo.postTime
        postTextLabel.text = postInfo.postText
    }

}

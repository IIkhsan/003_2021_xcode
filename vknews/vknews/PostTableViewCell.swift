//
//  PostTableViewCell.swift
//  vknews
//
//  Created by itisioslab on 28.09.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImageView: UIImageView!
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var pubTimeLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var postPicImageView: UIImageView!
    
    @IBOutlet weak var postPicImageView2: UIImageView!
    
    @IBOutlet weak var postPicImageView3: UIImageView!
    
    @IBOutlet weak var postPicImageView4: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func SetData(post: SinglePostCellData) {
        groupNameLabel.text = post.groupName
        descriptionTextView.text = post.description
        groupImageView.image = post.groupImage
        pubTimeLabel.text = post.publishingTime
        postPicImageView.image = post.pinnedPics[0]
        if post.pinnedPics.count == 2 {
            postPicImageView2.image = post.pinnedPics[1]
        }
        if post.pinnedPics.count == 4 {
            postPicImageView3.image = post.pinnedPics[2]
            postPicImageView4.image = post.pinnedPics[3]
        }
    }
}

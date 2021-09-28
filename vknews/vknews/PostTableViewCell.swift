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
        groupImageView.image = post.groupImage
        groupNameLabel.text = post.groupName
        pubTimeLabel.text = post.publishingTime
        descriptionTextView.text = post.description
        postPicImageView.image = post.pinnedPics[0]
        if post.pinnedPics.count > 1 {
            postPicImageView2.image = post.pinnedPics[1]
        }
        if post.pinnedPics.count > 2 {
            postPicImageView3.image = post.pinnedPics[2]
            postPicImageView4.image = post.pinnedPics[3]
        }
    }
}

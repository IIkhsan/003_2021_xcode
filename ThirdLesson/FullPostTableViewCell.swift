//
//  FullPostTableViewCell.swift
//  ThirdLesson
//
//  Created by Renat Murtazin on 28.09.2021.
//

import UIKit

class FullPostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func fullPostConfigure(_ post: PostStruct) {
        
        postImageView.image = post.postImage
        postTextView.text = post.postText
        profileLabel.text = post.profileLabel
        profileImageView.image = post.profileImage
//        postImageView.sizeToFit()
//        postTextView.sizeToFit()
//        profileLabel.sizeToFit()
//        profileImageView.sizeToFit()
    }
    
}

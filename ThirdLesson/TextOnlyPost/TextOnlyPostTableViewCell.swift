//
//  TextOnlyPostTableViewCell.swift
//  ThirdLesson
//
//  Created by Renat Murtazin on 28.09.2021.
//

import UIKit

class TextOnlyPostTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var profileLabel: UILabel!
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
    func textOnlyPostConfigure(_ postText: PostStruct) {
        profileImageView.image = postText.profileImage
        postTextView.text = postText.postText
        profileLabel.text = postText.profileLabel
//        profileImageView.sizeToFit()
//        profileLabel.sizeToFit()
//        postTextView.sizeToFit()
    }
}

//
//  ImageOnlyPostTableViewCell.swift
//  ThirdLesson
//
//  Created by Renat Murtazin on 28.09.2021.
//

import UIKit

class ImageOnlyPostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
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
    
    func imageOnlyPostConfigure(_ postImage: PostStruct) {
        
        postImageView.image = postImage.postImage
        profileImageView.image = postImage.profileImage
        profileLabel.text = postImage.profileLabel
//        postImageView.sizeToFit()
//        profileImageView.sizeToFit()
//        profileLabel.sizeToFit()
    }
    

}

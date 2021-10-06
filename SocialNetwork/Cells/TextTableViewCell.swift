//
//  TextTableViewCell.swift
//  SocialNetwork
//
//  Created by Илья on 05.10.2021.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var postProfilePicture: UIImageView!
    @IBOutlet weak var postUsername: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(post: Post) {
        postUsername.text = post.username
        postDescription.text = post.description
        postProfilePicture.image = post.profile_picture
        
        postProfilePicture.layer.cornerRadius = postProfilePicture.frame.size.width / 2
    }
}

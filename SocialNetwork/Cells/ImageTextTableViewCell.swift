//
//  ImageTextTableViewCell.swift
//  SocialNetwork
//
//  Created by Илья on 05.10.2021.
//

import UIKit

class ImageTextTableViewCell: UITableViewCell {

    @IBOutlet weak var postProfilePicture: UIImageView!
    @IBOutlet weak var postUsername: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postPicture: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(post: Post) {
        postProfilePicture.image = post.profile_picture
        postUsername.text = post.username
        postDescription.text = post.description
        postPicture.image = post.picture
        
        postProfilePicture.layer.cornerRadius = postProfilePicture.frame.size.width / 2
    }

}

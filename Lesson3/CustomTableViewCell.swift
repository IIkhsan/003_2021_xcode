//
//  CustomTableViewCell.swift
//  Lesson3
//
//  Created by Artem Kalugin on 24.09.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell, CustomTableViewCellProtocol {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var postText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setPost(post: Post) {
        avatar.image = UIImage(named: post.avatar)
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.contentMode = .scaleAspectFill
        avatar.layer.masksToBounds = true
        
        nicknameLabel.text = post.author
        photo.image = UIImage(named: post.photo)
        
        if post.post.count > 90 {
            postText.text = String(post.post.dropLast(post.post.count - 90)) + "..."
        } else {
            postText.text = post.post
        }
    }

}

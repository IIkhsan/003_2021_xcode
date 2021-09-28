//
//  PostCell.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 27.09.2021.
//

import UIKit

class PostCell: UITableViewCell, PostCellDelegate {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var authorUsernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.layer.masksToBounds = true
    }
    
    func loadData(with post: Post) {
        authorNameLabel.text = post.author.name
        authorUsernameLabel.text =
        post.author.username.starts(with: "@")
        ? post.author.username
        : "@\(post.author.username)"
        
        profileImageView.image = post.author.image
        if post.type == .both {
            postImage.image = post.image
            contentLabel.text = post.content
        }
        
    }
    
    
    
}

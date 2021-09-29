//
//  PostTextImageTableViewCell.swift
//  Lesson3
//
//  Created by Alexandr Onischenko on 29.09.2021.
//

import UIKit

class PostTextImageTableViewCell: UITableViewCell, CustomCell {

    @IBOutlet weak var authorAvatarImage: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var textPostLabel: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        authorAvatarImage.layer.cornerRadius = authorAvatarImage.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func configure(post: Post) {
        imagePost.image = post.image
        textPostLabel.text = post.text
        authorNameLabel.text = post.authorName
        authorAvatarImage.image = post.authorAvatar
    }
    
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

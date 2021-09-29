//
//  PostWithTextCell.swift
//  Lesson3
//
//  Created by Tagir Kabirov on 28.09.2021.
//

import UIKit

class PostWithTextCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postText: UILabel!
    
    var post = Post(postImg: UIImage(), postText: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(post: Post) {
        self.post = post
        self.postImg.image = post.postImg
        self.postText.text = post.postText
    }

}

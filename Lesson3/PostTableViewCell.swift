//
//  PostTableViewCell.swift
//  Lesson3
//
//  Created by Алсу Хайруллина on 28.09.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!

    var post: Post! {
        didSet {
            updateData()
        }
    }
    
    func updateData() {
        captionLabel.text = post.caption
        postImage.image = post.image
    }
}

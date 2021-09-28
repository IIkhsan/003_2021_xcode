//
//  ImageTextViewCell.swift
//  Lesson3
//
//  Created by Илья on 28.09.2021.
//

import UIKit

class ImageTextTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postUsername: UILabel!
    @IBOutlet weak var postText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(post: Post) {
        postText.text = post.textpost
        postImage.image = post.picture
    }
}


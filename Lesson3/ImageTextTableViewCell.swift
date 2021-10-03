//
//  ImageTextTableViewCell.swift
//  Lesson3
//
//  Created by Илья on 01.10.2021.
//

import UIKit

class ImageTextTableViewCell: UITableViewCell {

    @IBOutlet weak var postPicture: UIImageView!
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
        postUsername.text = post.nickname
        postDescription.text = post.description
        postPicture.image = post.picture
    }

}

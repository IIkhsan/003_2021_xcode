//
//  TableViewCell.swift
//  Lesson3
//
//  Created by Семен Соколов on 23.09.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func makePost(post: Post) {
        profileImage.image = post.profileImage
        profileNameLabel.text = post.profileLabel
        contentImage.image = post.contentImage
        infoLabel.text = post.info
    }
    
}

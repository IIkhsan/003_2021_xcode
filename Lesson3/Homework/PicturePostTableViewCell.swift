//
//  PictureTableViewCell.swift
//  Lesson3
//
//  Created by Даниил Багаутдинов on 25.09.2021.
//

import UIKit

class PicturePostTableViewCell: UITableViewCell {
    @IBOutlet weak var communitieImageView: UIImageView!
    @IBOutlet weak var communitieLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(post: PicturePostCellData) {
        communitieLabel.text = post.communitie
        communitieImageView.image = post.communitieImage
        publicationDateLabel.text = post.publicationDate
        postImageView.image = post.postImage
    }

}

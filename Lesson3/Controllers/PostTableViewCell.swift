//
//  PostTableViewCell.swift
//  Lesson3
//
//  Created by Роман Сницарюк on 22.09.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell, Configurable {
    
    //MARK: - UI
    @IBOutlet weak var authorNameTextLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var authorAvatarImageView: UIImageView!
    @IBOutlet weak var descriptionForImageLabel: UILabel!
    
    //MARK: - Cell's methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Configure
    func configure(_ post: Post) {
        authorNameTextLabel.text = post.author.name
        authorAvatarImageView.image = post.author.avatar
        if post.image == nil {
            mainImageView.image = UIImage(named: "trash")
        } else {
            mainImageView.image = post.image
        }
        if post.text == nil {
            descriptionForImageLabel.text = "Error: данные не загрузились"
            self.descriptionForImageLabel.textColor = .red
        } else {
            descriptionForImageLabel.text = post.text
        }
    }
}

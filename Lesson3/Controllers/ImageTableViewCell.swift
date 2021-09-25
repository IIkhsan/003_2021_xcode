//
//  ImageTableViewCell.swift
//  Lesson3
//
//  Created by Роман Сницарюк on 24.09.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell, Configurable {
    //MARK: - UI
    @IBOutlet weak var authorAvatarImageView: UIImageView!
    @IBOutlet weak var authorNickTextLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    //MARK: - Cell's methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Configure
    func configure(_ post: Post) {
        authorNickTextLabel.text = post.author.name
        authorAvatarImageView.image = post.author.avatar
        mainImageView.image = post.image
    }
}

//
//  PhotoCustomTableViewCell.swift
//  Lesson3
//
//  Created by Artem Kalugin on 26.09.2021.
//

import UIKit

class PhotoCustomTableViewCell: UITableViewCell, CustomTableViewCellProtocol {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setPost(post: Post) {
        avatar.image = UIImage(named: post.avatar)
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.contentMode = .scaleAspectFill
        avatar.layer.masksToBounds = true
        
        nicknameLabel.text = post.author
        photo.image = UIImage(named: post.photo)
    }

}

//
//  CustomTableViewCell.swift
//  Thirdpair
//
//  Created by Тимур Миргалиев on 27.09.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var someTextLabel: UILabel!
    
    @IBOutlet weak var imageOfPost: UIImageView!
    
    @IBOutlet weak var textOfPost: UILabel!
    
    
    
    func configure(text: String, avatar: String, messageText: String, imagePost: String) {
        avatarImage.image = UIImage(named: avatar)
        imageOfPost.image = UIImage(named: imagePost)
        someTextLabel.text = text
        textOfPost.text = messageText
        avatarImage.layer.cornerRadius = 20
    }

}

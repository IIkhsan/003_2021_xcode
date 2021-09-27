//
//  TextTableViewCell.swift
//  Lesson3
//
//  Created by Руслан on 29.07.2021.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var groupLogoImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    var indexPath: IndexPath?
    
    func configure(with post: Post, at indexPath: IndexPath) {
        self.indexPath = indexPath
        
        groupNameLabel.text = post.groupName
        dateLabel.text = post.date
        groupLogoImageView.image = post.groupLogo
        groupLogoImageView.layer.cornerRadius = groupLogoImageView.frame.size.width / 2
        contentLabel.text = post.text
    }
    
}

//
//  TableViewCellTimeline.swift
//  Lesson3
//
//  Created by Милана Махсотова on 27.09.2021.
//

import UIKit

class TableViewCellTimeline: UITableViewCell {

    
    @IBOutlet weak var textOfPost: UITextView! {
        didSet {
            textOfPost.sizeToFit()
            textOfPost.backgroundColor = .systemGray
        }
    }
    @IBOutlet weak var nicknameLabel: UILabel! {
        didSet {
            nicknameLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        }
    }
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.makeRoundAvatar()
            avatarImageView.layer.borderColor = UIColor.black.cgColor
            avatarImageView.layer.borderWidth = 0.8
        }
    }
    
    func prepareCell(post: Post) {
        avatarImageView.image = post.authorImage
        nicknameLabel.text = post.author
        textOfPost.textContainer.maximumNumberOfLines = 5
      
        if let image = post.image {
            postImageView.image = image
        }
//        else  {
//            postImageView.isHidden = true
//        }
        
        if post.description != nil {
            textOfPost.text = post.description
        }
        else {
            textOfPost.isHidden = true
        }

    }
    
}

extension UIImageView {
    func makeRoundAvatar() {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
 
    }
}

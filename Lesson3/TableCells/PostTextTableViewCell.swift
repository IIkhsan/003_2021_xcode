//
//  TableViewCell.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit


class PostTextTableViewCell: PostTableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func configure(post: Post, delegate: PostTableViewCellDelegate) {
        super.configure(post: post, delegate: delegate)
        usernameLabel.text = post.author.username
        userImage.image = post.author.image
        postTextView.text = post.text
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        guard let post = post else { return }
        delegate?.didTapButton(post: post, cell: self)
    }
    
}

//
//  TextTableViewCell.swift
//  Lesson3
//
//  Created by Эльмира Байгулова on 28.09.2021.
//

import UIKit

class TextTableViewCell: PostTableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configure(post: Post,delegate: PostTableViewCellDelegate) {
        super.configure(post: post, delegate: delegate)
        userNameLabel.text = post.author.userName
        accountNameLabel.text = post.author.accountName
        dateLabel.text = post.date
        postTextLabel.text = post.text
        userImageView.image = post.author.accountImage
    }
    
    @IBAction func didTapButton(_ sender: Any) {
         guard let post = post else { return }
         delegate?.didTapButton(post: post, cell: self)
     }

}

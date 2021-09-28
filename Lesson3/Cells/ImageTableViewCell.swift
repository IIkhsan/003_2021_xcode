//
//  ImageTableViewCell.swift
//  Lesson3
//
//  Created by Эльмира Байгулова on 28.09.2021.
//

import UIKit

class ImageTableViewCell: PostTableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configure(post: Post, delegate: PostTableViewCellDelegate) {
        super.configure(post: post, delegate: delegate)
        userNameLabel.text = post.author.userName
        accountNameLabel.text = post.author.accountName
        dateLabel.text = post.date
        userImageView.image = post.author.accountImage
        postImageView.image = post.postImage
        makeImageViewRound(image: userImageView)

        
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        guard let post = post else { return }
        delegate?.didTapButton(post: post, cell: self)
    }
    
    func makeImageViewRound(image: UIImageView) {
            image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }


}

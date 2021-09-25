//
//  PostWithoutImageTableViewCell.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 24.09.2021.
//

import UIKit

class PostWithoutImageTableViewCell: UITableViewCell {
    
    //MARK: Properties
    let layerManager = LayerManager()
    var post: Post?
    weak var delegate: PostTableViewCellDelegate?
    var isLikePressed = false
        
    //MARK: IBOutlets
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    //MARK: IBActions
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        isLikePressed = !isLikePressed
        if isLikePressed {
            delegate?.likeTapped(sender: self)
            likeButton.setImage(UIImage(named: "like_filled"), for: .normal)
            post?.likesCount += 1
        } else {
            delegate?.likeCanceled(sender: self)
            likeButton.setImage(UIImage(named: "like"), for: .normal)
            post?.likesCount -= 1
        }
        likesCountLabel.text = post?.likesCount.description
    }
    
    //MARK: Cell methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Functions
    public func configure(post: Post) {
        self.post = post
        display(post: post)
        layerManager.makeViewRounded(view: authorImageView)
    }
    
    public func makeViewRounded(view: UIImageView) {
        view.layer.borderWidth = 1
           view.layer.masksToBounds = false
           view.layer.borderColor = UIColor.black.cgColor
           view.layer.cornerRadius = view.frame.height/2
           view.clipsToBounds = true
    }
    
    private func display(post: Post) {
        authorImageView.image = post.authorImage
        authorNameLabel.text = post.authorName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY, MMM d"
        dateLabel.text = dateFormatter.string(from: post.date)
        contentLabel.text = post.content
        likesCountLabel.text = post.likesCount.description
    }
}

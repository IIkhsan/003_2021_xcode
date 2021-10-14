//
//  PostDetailViewController.swift
//  Lesson3
//
//  Created by Милана Махсотова on 28.09.2021.
//

import UIKit

protocol PostDetailViewControllerDelegate: AnyObject {
    
}

class PostDetailViewController: UIViewController {
    

    var post: Post?
    weak var delegate: PostDetailViewControllerDelegate?

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UILabel! {
        didSet {
           
            descriptionTextView.backgroundColor = .systemGray
            descriptionTextView.backgroundColor = .systemGray
        }
    }
    @IBOutlet weak var nicknameLabel: UILabel! {
        didSet {
            nicknameLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.makeRoundAvatar()
            avatarImageView.layer.borderColor = UIColor.black.cgColor
            avatarImageView.layer.borderWidth = 0.8
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    private func configure() {
        guard let post = post else { return }
        
        nicknameLabel.text = post.author
        avatarImageView.image = post.authorImage
       
        if post.description != nil {
            descriptionTextView.text = post.description
        } else {
            descriptionTextView.isHidden = true
        }
        
        if let image = post.image {
            imageView.image = image
        }
        else {
            imageView.isHidden = true
        }
        
        view.backgroundColor = .systemGray
        
        descriptionTextView.numberOfLines = 0
        descriptionTextView.frame.size.width = 1000

        descriptionTextView.sizeToFit()
    }
}

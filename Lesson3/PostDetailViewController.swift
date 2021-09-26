//
//  StudentDetailViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

protocol PostDetailViewControllerDelegate: AnyObject {
    func onDataChange(post: Post)
}

class PostDetailViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    
    var post: Post?
    weak var delegate: PostDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        guard let post = post else { return }
        userImage.image = post.author.image
        userNameLabel.text = post.author.username
        postTextView.text = post.text
        postTextView.sizeToFit()
        postImage.image = post.image
        delegate?.onDataChange(post: post)
    }
}

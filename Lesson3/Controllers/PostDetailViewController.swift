//
//  PostViewController.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 28.09.2021.
//

import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorProfileImageView: UIImageView!
    @IBOutlet weak var authorUsernameLabel: UILabel!
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var parentView: UIView!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorProfileImageView.layer.cornerRadius = authorProfileImageView.frame.height / 2
        authorProfileImageView.clipsToBounds = true
        loadData(with: post)
        updateConstraint(viewHeightConstraint)
        parentView.layoutIfNeeded()
    }
    
    func loadData(with post: Post?) {
        authorProfileImageView.image = post?.author.image
        authorNameLabel.text = post?.author.name
        if let username = post?.author.username {
            authorUsernameLabel.text = "@\(username)"
        }
    }
    
    func updateConstraint(_ constraint: NSLayoutConstraint) {}
}

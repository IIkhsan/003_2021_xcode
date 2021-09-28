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
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorProfileImageView.layer.cornerRadius = authorProfileImageView.frame.height / 2
        authorProfileImageView.clipsToBounds = true
        loadData(with: post)
    }
    
    func loadData(with post: Post?) {
        authorProfileImageView.image = post?.author.image
        authorNameLabel.text = post?.author.name
        authorUsernameLabel.text = post?.author.username
    }
}

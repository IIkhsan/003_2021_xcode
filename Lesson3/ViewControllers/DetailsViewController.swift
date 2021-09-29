//
//  DetailsViewController.swift
//  Lesson3
//
//  Created by Alexandr Onischenko on 29.09.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var authorAvatarImage: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var textPostLabel: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authorAvatarImage.image = post.authorAvatar
        authorNameLabel.text = post.authorName
        textPostLabel.text = post.text
        imagePost.image = post.image
    }
}

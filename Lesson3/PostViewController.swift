//
//  PostViewController.swift
//  Lesson3
//
//  Created by Алексей Горбунов on 27.09.2021.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post!
    
    @IBOutlet weak var postImage: UIImageView?
    @IBOutlet weak var postText: UITextView?
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "nayfront"
        
        postImage?.image = post.postImage
        postText?.text = post.postText
        postText?.isEditable = false
        
        if postImage?.image == nil {
            topConstraint.constant = -1*imageHeightConstraint.constant
        }
    }
}

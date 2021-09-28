//
//  PostViewController.swift
//  Lesson3
//
//  Created by Илья on 28.09.2021.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post!
    
    
    @IBOutlet weak var postImage: UIImageView?
    @IBOutlet weak var postText: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Feed"
        
        postImage?.image = post.picture
        postText?.text = post.textpost
        postText?.isEditable = false
    }
}

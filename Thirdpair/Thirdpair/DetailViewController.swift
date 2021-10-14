//
//  DetailViewController.swift
//  Thirdpair
//
//  Created by Тимур Миргалиев on 28.09.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - LABELS
    @IBOutlet weak var nameHowPost: UILabel!
    @IBOutlet weak var textOfPost: UILabel!
    @IBOutlet weak var daeOfPost: UILabel!
    
    //MARK: - IMAGE VIEW
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var imageOfPost: UIImageView!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.image = UIImage(named: post?.avatar ?? "image1")
        avatar.layer.cornerRadius = avatar.frame.size.height / 2
        nameHowPost.text = post?.name
        textOfPost.text = post?.textOfPost
        imageOfPost.image = UIImage(named: post?.imageOfOfPost ?? " ")
        daeOfPost.text = post?.datePost
    }
}

//
//  PhotoDetailViewController.swift
//  Lesson3
//
//  Created by Artem Kalugin on 26.09.2021.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        guard let post = post else { return }
        nicknameLabel.text = post.author
        photo.image = UIImage(named: post.photo)
        
        avatar.image = UIImage(named: post.avatar)
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.contentMode = .scaleAspectFill
        avatar.layer.masksToBounds = true
    }
}

//
//  DetailViewController.swift
//  Lesson3
//
//  Created by Эльмира Байгулова on 28.09.2021.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func onDataChange(post: Post)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    var post: Post?
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        guard let post = post else {
            return
        }
        userNameLabel.text = post.author.userName
        accountNameLabel.text = post.author.accountName
        dateLabel.text = post.date
        postTextLabel.text = post.text
        userImageView.image = post.author.accountImage
        postImageView.image = post.postImage
        delegate?.onDataChange(post: post)
    }
}

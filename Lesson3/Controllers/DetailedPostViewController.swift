//
//  DetailedPostViewController.swift
//  Lesson3
//
//  Created by Роман Сницарюк on 22.09.2021.
//

import UIKit

class DetailedPostViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var authorAvatarImageView: UIImageView!
    @IBOutlet weak var authorNameTextLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var textForImageView: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Variables
    var post: Post?
    
    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Helpers
    private func configure() {
        guard let post = post else { return }
        configure(post)
    }
    
    func configure(_ post: Post) {
        authorAvatarImageView.image = post.author.avatar
        authorNameTextLabel.text = post.author.name
        mainImageView.image = post.image
        textForImageView.text = post.text
    }
}

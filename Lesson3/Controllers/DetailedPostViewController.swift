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
        guard let unwrappedPost = post else { return }
        authorAvatarImageView.image = unwrappedPost.author?.avatar
        authorNameTextLabel.text = unwrappedPost.author?.name
        mainImageView.image = unwrappedPost.image
        textForImageView.text = unwrappedPost.text
    }
}

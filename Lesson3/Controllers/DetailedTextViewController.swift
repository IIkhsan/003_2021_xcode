//
//  DetailedTextViewController.swift
//  Lesson3
//
//  Created by Роман Сницарюк on 24.09.2021.
//

import UIKit

class DetailedTextViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var authorAvatarImageView: UIImageView!
    @IBOutlet weak var authorNickTextLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    
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
        authorAvatarImageView.image = post.author.avatar
        authorNickTextLabel.text = post.author.name
        mainTextLabel.text = post.text
    }
}

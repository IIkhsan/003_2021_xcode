//
//  PostDetailViewController.swift
//  Lesson3
//
//  Created by Милана Махсотова on 28.09.2021.
//

import UIKit

protocol PostDetailViewControllerDelegate: AnyObject {
    func onDataChange(post: Post)
}

class PostDetailViewController: UIViewController {
    

    var post: Post?
    weak var delegate: PostDetailViewControllerDelegate?

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UILabel! {
        didSet {
           
            descriptionTextView.backgroundColor = .systemGray
//            descriptionTextView.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
            descriptionTextView.backgroundColor = .systemGray
        }
    }
    @IBOutlet weak var nicknameLabel: UILabel! {
        didSet {
            nicknameLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        }
    }
    
    
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.maskCircle()
            avatarImageView.layer.borderColor = UIColor.black.cgColor
            avatarImageView.layer.borderWidth = 0.8
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    private func configure() {
        guard let post = post else { return }
        
        nicknameLabel.text = post.author
        avatarImageView.image = post.authorImage
        descriptionTextView.text = post.description
        imageView.image = post.image
        
        view.backgroundColor = .systemGray
        
        descriptionTextView.numberOfLines = 0
        descriptionTextView.frame.size.width = 1000

        descriptionTextView.sizeToFit()
        
       
        
        delegate?.onDataChange(post: post)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

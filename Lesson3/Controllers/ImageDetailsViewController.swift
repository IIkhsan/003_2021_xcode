//
//  ImageDetailsViewController.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 28.09.2021.
//

import UIKit

class ImageDetailsViewController: PostDetailViewController {
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func loadData(with post: Post?) {
        super.loadData(with: post)
        contentImageView.image = post?.image
    }
    
    override func updateConstraint(_ constraint: NSLayoutConstraint) {
        let headerHeight: CGFloat = 100
        let imageHeight = contentImageView.frame.height
        let space: CGFloat = 100
        constraint.constant = max(constraint.constant, headerHeight + imageHeight + space)
    }
}

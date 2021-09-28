//
//  MixedDetailsViewController.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 28.09.2021.
//

import UIKit

class MixedDetailsViewController: ContentDetailsViewController {
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func loadData(with post: Post?) {
        super.loadData(with: post)
        contentImageView.image = post?.image
    }
    
    override func updateConstraint(_ constraint: NSLayoutConstraint) {
        let contentHeight = contentImageView.frame.height + contentLabel.frame.height + 50
        let headerHeight: CGFloat = 100
        let space: CGFloat = 100
        constraint.constant = max(constraint.constant,
                                  contentHeight + headerHeight + space)
    }
}

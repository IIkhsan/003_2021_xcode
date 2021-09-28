//
//  ContentDetailsViewController.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 28.09.2021.
//

import UIKit

class ContentDetailsViewController: PostDetailViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func loadData(with post: Post?) {
        super.loadData(with: post)
        contentLabel.text = post?.content
        contentLabel.sizeToFit()
        view.layoutIfNeeded()
    }
    
    override func updateConstraint(_ constraint: NSLayoutConstraint) {
        let headerHeight: CGFloat = 100
        let contentHeight = contentLabel.frame.height
        constraint.constant = max(constraint.constant,
                                  headerHeight+contentHeight)
        
    }
}

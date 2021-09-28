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
}

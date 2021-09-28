//
//  PostCell-Content.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 28.09.2021.
//

import UIKit

class PostCell_Content: PostCell {
    override func loadData(with post: Post) {
        super.loadData(with: post)
        contentLabel.text = post.content
    }
}

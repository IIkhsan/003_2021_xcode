//
//  TableViewCell.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit


protocol PostTableViewCellDelegate: AnyObject {
    func didTapButton(post: Post, cell: UITableViewCell)
}

class PostTableViewCell: UITableViewCell {
    
    var post: Post?
    
    weak var delegate: PostTableViewCellDelegate?
    
    
    func configure(post: Post, delegate: PostTableViewCellDelegate) {
        self.post = post
        self.delegate = delegate
    }
}

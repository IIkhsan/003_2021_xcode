//
//  TableViewCell.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didTapButton(post: Post, cell: UITableViewCell)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    
    var post: Post?
    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
//    func configure(post: Post, delegate: TableViewCellDelegate) {
//        descriptionLabel.text = post.text
//        imagePost = UIImageView(image: post.image)
//        self.post = post
//        self.delegate = delegate
//    }
}

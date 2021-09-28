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

    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var groupNumberLabel: UILabel!
    
    var post: Post?
    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(post: Post, delegate: TableViewCellDelegate) {
        studentNameLabel.text = post.username
        groupNumberLabel.text = post.textpost
        self.post = post
        self.delegate = delegate
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        guard let post = post else { return }
        //post.groupNumber = "13-123"
        delegate?.didTapButton(post: post, cell: self)
    }
    
}

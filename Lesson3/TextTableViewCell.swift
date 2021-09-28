//
//  TextTableViewCell.swift
//  Lesson3
//
//  Created by Илья on 28.09.2021.
//

import UIKit

class TextTableViewCell: UITableView {

    @IBOutlet weak var postUsername: UILabel!
    @IBOutlet weak var postText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(post: Post) {
        postText.text = post.postText
    }
}

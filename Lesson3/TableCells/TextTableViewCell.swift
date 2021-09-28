//
//  TextTableViewCell.swift
//  Lesson3
//
//  Created by Marat Giniyatov on 27.09.2021.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var mainText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(publication: Publication) {
        usernameLabel.text = publication.username
        userImage.image = publication.profileImage
        userImage.layer.cornerRadius = userImage.bounds.width / 2
        mainText.text = publication.mainText
    }
}

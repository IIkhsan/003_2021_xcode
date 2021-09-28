//
//  ImageTableViewCell.swift
//  Lesson3
//
//  Created by Marat Giniyatov on 27.09.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var mainImage: UIImageView!
    
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
        mainImage.image = publication.mainImage
    }
}

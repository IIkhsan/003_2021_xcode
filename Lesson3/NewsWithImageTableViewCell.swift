//
//  NewsWithImageTableViewCell.swift
//  Lesson3
//
//  Created by Alina Bikkinina on 26.09.2021.
//

import UIKit

class NewsWithImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupTitleLabel: UILabel!
    
    @IBOutlet weak var groupImageView: UIImageView!
    
    @IBOutlet weak var postTimeLabel: UILabel!
    
    @IBOutlet weak var postTextLabel: UILabel!
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData (postInfo: NewsWithImage) -> Void {
        groupTitleLabel.text = postInfo.groupTitle
        groupImageView.image = postInfo.groupImg
        postTimeLabel.text = postInfo.postTime
        postTextLabel.text = postInfo.postText
        postImageView.image = postInfo.postImage
    }
}

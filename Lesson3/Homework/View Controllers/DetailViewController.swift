//
//  DetailViewController.swift
//  Lesson3
//
//  Created by Руслан on 29.07.2021.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: UI
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var groupLogoImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    // MARK: Properties
    var post: Post?
    
    // MARK: View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupNameLabel.text = post?.groupName
        dateLabel.text = post?.date
        groupLogoImageView.image = post?.groupLogo
        groupLogoImageView.layer.cornerRadius = groupLogoImageView.frame.size.width / 2
        contentLabel.text = post?.text
        contentImageView.image = post?.image
    }
    
    // MARK: Methods
    static func getId() -> String {
        return String(describing: self)
    }
    
}

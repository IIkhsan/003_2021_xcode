//
//  FullInformationViewController.swift
//  Lesson3
//
//  Created by Даниил Багаутдинов on 23.09.2021.
//

import UIKit

class FullInformationViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var communitieLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var communitieImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var articleLabel: UILabel!
    
    
    var postCellData: PostCellData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        scrollView.contentSize = CGSize(width: 320, height: 1100)
        guard let postCellData = postCellData else { return }
        communitieLabel.text = postCellData.communitie
        publicationDateLabel.text = postCellData.publicationDate
        communitieImageView.image = postCellData.communitieImage
        postImageView.image = postCellData.postImage
        articleLabel.text = postCellData.article
        articleLabel.sizeToFit()
    }
}

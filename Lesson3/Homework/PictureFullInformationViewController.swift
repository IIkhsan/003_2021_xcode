//
//  PictureFullInformationViewController.swift
//  Lesson3
//
//  Created by Даниил Багаутдинов on 25.09.2021.
//

import UIKit

class PictureFullInformationViewController: UIViewController {

    @IBOutlet weak var communitieImageView: UIImageView!
    @IBOutlet weak var communitieLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    var picturePostCellData: PicturePostCellData?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let picturePostCellData = picturePostCellData else { return }
        communitieImageView.image = picturePostCellData.communitieImage
        communitieLabel.text = picturePostCellData.communitie
        publicationDateLabel.text = picturePostCellData.publicationDate
        postImageView.image = picturePostCellData.postImage
    }
}

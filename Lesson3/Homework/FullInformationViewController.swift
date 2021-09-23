//
//  FullInformationViewController.swift
//  Lesson3
//
//  Created by Даниил Багаутдинов on 23.09.2021.
//

import UIKit

class FullInformationViewController: UIViewController {
    
    @IBOutlet weak var communitieLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var communitieImageView: UIImageView!
    @IBOutlet weak var articleTextView: UITextView!
    
    var postCellData: PostsCellData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        articleTextView.isEditable = false
        guard let postCellData = postCellData else { return }
        communitieLabel.text = postCellData.communitie
        publicationDateLabel.text = postCellData.publicationDate
        communitieImageView.image = postCellData.communitieImage
        articleTextView.text = postCellData.article
        
    }
    
    
}

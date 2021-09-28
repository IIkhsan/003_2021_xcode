//
//  PublicationDetailViewController.swift
//  Lesson3
//
//  Created by Marat Giniyatov on 27.09.2021.
//

import UIKit

protocol ImageTextDetailViewControllerDelegate: AnyObject {
    func onDataChange(publication: Publication)
}

class ImageTextDetailViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTextView: UITextView!
    
    var publication: Publication?
   weak  var delegate: ImageTextDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let publication = publication else {return}
        usernameLabel.text = publication.username
        userImageView.image = publication.profileImage
        mainImageView.image = publication.mainImage
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
        mainTextView.text = publication.mainText
        mainTextView.sizeToFit()
            }
}

//
//  ImageDetailViewController.swift
//  Lesson3
//
//  Created by Marat Giniyatov on 27.09.2021.
//

import UIKit
protocol ImageDetailViewControllerDelegate: AnyObject {
    func refreshTable()
}

class ImageDetailViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    var publication: Publication?
    weak var delegate: ImageDetailViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        guard let publication = publication else {return}
        usernameLabel.text = publication.username
        userImageView.image = publication.profileImage
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
        mainImageView.image = publication.mainImage
    }
}

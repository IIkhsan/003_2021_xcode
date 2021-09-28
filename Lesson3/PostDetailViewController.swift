//
//  StudentDetailViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

protocol StudentDetailViewControllerDelegate: AnyObject {
    func onDataChange(post: Post)
}

class StudentDetailViewController: UIViewController {
    
    // UI
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var groupNumberLabel: UILabel!
    
    // Properties
    var post: Post?
    weak var delegate: StudentDetailViewControllerDelegate?

    // - MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    // Private methods
    private func configure() {
        guard let post = post else { return }
        
        nameLabel.text = post.username
        groupNumberLabel.text = post.textpost
        
        
        delegate?.onDataChange(post: post)
    }
}

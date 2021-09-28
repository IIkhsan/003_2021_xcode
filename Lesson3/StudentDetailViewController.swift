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
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var image: UIImage!
    
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
        
        text.text = post.text
        image = post.image
        
        
        delegate?.onDataChange(post: post)
    }
}

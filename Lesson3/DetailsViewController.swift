//
//  DetailsViewController.swift
//  Lesson3
//
//  Created by Алсу Хайруллина on 28.09.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fixedWidth = captionTextView.frame.size.width
        let newSize = captionTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        captionTextView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        
        captionTextView.text = post?.caption
        postImage.image = post?.image
    }

}

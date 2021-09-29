//
//  ImageAndTextViewController.swift
//  Lesson3
//
//  Created by Tagir Kabirov on 29.09.2021.
//

import UIKit

class ImageAndTextViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UITextView!
    
    var imgSegue = UIImage()
    var textSegue = ""
    
    override func viewDidLoad() {
        image.image = imgSegue
        text.text = textSegue
    }
    

}

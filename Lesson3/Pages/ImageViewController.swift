//
//  ImageViewController.swift
//  Lesson3
//
//  Created by Tagir Kabirov on 29.09.2021.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var imgSegue = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = imgSegue
    }

}

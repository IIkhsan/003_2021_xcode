//
//  TextViewController.swift
//  Lesson3
//
//  Created by Tagir Kabirov on 29.09.2021.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    
    var textSegue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = textSegue
    }
}

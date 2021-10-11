//
//  DetailPostViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 24.09.2021.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    //MARK: - Properties
    var post: Post?
    
    //MARK: - IBOutlets
    @IBOutlet var detailView: DetailView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.configure(post: post)
    }
}

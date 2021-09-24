//
//  DetailPostViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 24.09.2021.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    //MARK: Properties
    var post: Post?
    let layerManager = LayerManager()
    
    //MARK: IB Outlets
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    //MARK: VC MEthods
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: Functions
    private func configure() {
        authorImageView.image = post?.authorImage
        authorNameLabel.text = post?.authorName
        dateLabel.text = post?.date.description
        contentLabel.text = post?.content
        contentImageView.image = post?.contentImage
        layerManager.makeViewRounded(view: authorImageView)
    }
}

//
//  PostViewController.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 28.09.2021.
//

import UIKit

class PostDetailViewController: UITableViewController {
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorProfileImageView: UIImageView!
    @IBOutlet weak var authorUsernameLabel: UILabel!
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorProfileImageView.layer.cornerRadius = authorProfileImageView.frame.height / 2
        authorProfileImageView.clipsToBounds = true
        loadData(with: post)
    }

    // MARK: - Table view data source and delegate methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func loadData(with post: Post?) {
        authorProfileImageView.image = post?.author.image
        authorNameLabel.text = post?.author.name
        authorUsernameLabel.text = post?.author.username
    }
}

//
//  NewsViewController.swift
//  Lesson3
//
//  Created by Роман Сницарюк on 22.09.2021.
//

import UIKit

class NewsViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    private var posts: [Post] = []
    private let dataManager = DataManager()

    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = dataManager.generatePosts(15)
        configure()
    }
    
    //MARK: - Table's method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let post = posts[indexPath.row]
        if post.image == nil, post.text != nil {
            performSegue(withIdentifier: "textPostSeque", sender: post)
        } else {
            performSegue(withIdentifier: "postSeque", sender: post)
        }
    }
    
    //MARK: - Helpers
    private func configure() {
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postTableCellIndetifier")
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "imageTableCellIndetifier")
        tableView.register(UINib(nibName: "TextTableViewCell", bundle: nil), forCellReuseIdentifier: "textTableCellIndetifier")
        tableView.estimatedRowHeight = 400
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postSeque",
           let viewController = segue.destination as? DetailedPostViewController,
            let post = sender as? Post {
                viewController.post = post
        }
        if segue.identifier == "textPostSeque", let viewController = segue.destination as? DetailedTextViewController,
           let post = sender as? Post {
            viewController.post = post
        }
    }
}

// MARK: - Table view data source & delegate
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell: Configurable
        if post.image == nil && post.text != nil {
            cell = tableView.dequeueReusableCell(withIdentifier: "textTableCellIndetifier", for: indexPath) as! TextTableViewCell
        } else if post.text == nil && post.image != nil {
            cell = tableView.dequeueReusableCell(withIdentifier: "imageTableCellIndetifier", for: indexPath) as! ImageTableViewCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "postTableCellIndetifier", for: indexPath) as! PostTableViewCell
        }
        cell.configure(post)
        return cell as! UITableViewCell
    }
}

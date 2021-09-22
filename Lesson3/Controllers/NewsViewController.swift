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
    private var posts: [Post?]?
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
        guard let unwrappedPost = posts![indexPath.row] else { return }
        performSegue(withIdentifier: "postSeque", sender: unwrappedPost)
    }
    
    //MARK: - Helpers
    private func configure() {
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        tableView.estimatedRowHeight = 400
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postSeque",
           let viewController = segue.destination as? DetailedPostViewController,
            let post = sender as? Post {
                viewController.post = post
        }
    }
}

// MARK: - Table view data source & delegate
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil {
            return posts!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! PostTableViewCell
        cell.configure(posts![indexPath.row])
        return cell
    }
}


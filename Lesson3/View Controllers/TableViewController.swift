//
//  TableViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 23.09.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    //MARK: Properties
    var posts: [Post] = []
    let dataManager = DataManager()

    //MARK: VC Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = dataManager.generateArrayOfPosts(count: 28)
        tableView.register(UINib.init(nibName: "PostWithoutImageTableViewCell", bundle: nil), forCellReuseIdentifier: "postWithoutImage")
        tableView.register(UINib.init(nibName: "PostWithImageTableViewCell", bundle: nil), forCellReuseIdentifier: "postWithImage")
        tableView.estimatedRowHeight = 512
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        if post.contentImage == nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "postWithoutImage") as? PostWithoutImageTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.configure(post: post)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "postWithImage") as? PostWithImageTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.configure(post: post)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "postDetailShow", sender: indexPath)
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postDetailShow" {
            guard let indexPath = sender as? IndexPath else { return }
            guard let detailViewController = segue.destination as? DetailPostViewController else { return }
            detailViewController.post = posts[indexPath.row]
        }
    }
}

    //MARK: Extensions
extension TableViewController: PostTableViewCellDelegate {
    func likeTapped( sender: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else { return }
        posts[indexPath.row].likesCount += 1
    }
    
    func likeCanceled(sender: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else { return }
        posts[indexPath.row].likesCount -= 1
    }
}

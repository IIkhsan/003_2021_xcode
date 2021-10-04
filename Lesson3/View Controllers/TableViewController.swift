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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(post: posts[indexPath.row])
        return cell
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

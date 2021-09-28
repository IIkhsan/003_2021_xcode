//
//  PostsViewController.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 27.09.2021.
//

import UIKit

class PostsViewController: UITableViewController {
    
    let postManager = PostManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib(K.postCell, with: K.postCell)
        registerNib(K.postCell_Image, with: K.postCell_Image)
        registerNib(K.postCell_Content, with: K.postCell_Content)
        
    }
    
    func registerNib(_ nibName: String, with identifier: String) {
        tableView
            .register(
                UINib(nibName: nibName, bundle: nil)
                ,forCellReuseIdentifier: identifier)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postManager.posts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = postManager.posts[indexPath.row]
        
        switch post.type {
            case .imageOnly: return 300
            case .contentOnly: return 250
            case .both: return 500
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get the post
        let post = postManager.posts[indexPath.row]
        
        // get the appropriate cell based on post type
        let cell: PostCellDelegate?
        
        switch post.type {
            case .contentOnly:
                cell = getPostCell(withIdentifier: K.postCell_Content,
                                   for: indexPath,
                                   as: PostCell_Content.self)
            case .imageOnly:
                cell = getPostCell(withIdentifier: K.postCell_Image,
                                   for: indexPath,
                                   as: PostCell_Image.self)
            case .both:
                cell = getPostCell(withIdentifier: K.postCell,
                                   for: indexPath,
                                   as: PostCell.self)
        }
        
        // return the cell
        if let cell = cell {
            cell.loadData(with: post)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = postManager.posts[indexPath.row]
        switch post.type {
            case .imageOnly:
                performSegue(withIdentifier: K.goToImageOnly, sender: post)
            case .contentOnly:
                performSegue(withIdentifier: K.goToContentOnly, sender: post)
            case .both:
                performSegue(withIdentifier: K.goToBoth, sender: post)
        }
    }
    
    // MARK: - Table view helper functions
    private func getPostCell<T: UITableViewCell>(withIdentifier identifier: String,
                                                 for indexPath: IndexPath,
                                                 as type: T.Type) -> T? {
        return tableView.dequeueReusableCell(withIdentifier: identifier,
                                             for: indexPath) as? T
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PostDetailViewController,
              let sender = sender as? Post else { return }
        vc.post = sender
    }
    
    
}

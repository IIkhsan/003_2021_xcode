//
//  ViewController.swift
//  Lesson3
//
//  Created by Эльмира Байгулова on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = [
        Post.init(author: User.init(userName: "DUNE", accountName: "dunemovie", accountImage: #imageLiteral(resourceName: "duneAccountImage")), text: "it's time. #DuneMovie coming October 22.", postImage: #imageLiteral(resourceName: "dunePostImage"), date: "4 oct 2021"),
        .init(author: User.init(userName: "Netflix", accountName: "netflix", accountImage: #imageLiteral(resourceName: "netflixAccountImage")), text: "A new look at ‘STRANGER THINGS’ Season 4.", postImage: nil, date: "5 sep 2021"),
        .init(author: User.init(userName: "Cats", accountName: "cats", accountImage: #imageLiteral(resourceName: "catsAccountImage")), text: nil, postImage: #imageLiteral(resourceName: "catPostImage"), date: "21 sep 2020")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "ImageTableViewCell" )
        tableView.register(ImageTextTableViewCell.self, forCellReuseIdentifier: "ImageTextTableViewCell" )
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: "TextTableViewCell" )
    }
}

extension ViewController: DetailViewControllerDelegate {
    func onDataChange(post: Post) {
        posts.append(post)
        tableView.reloadData()
    }
}

extension ViewController: PostTableViewCellDelegate {
    func didTapButton(post: Post, cell: UITableViewCell) {
        guard let cellIndexPath = tableView.indexPath(for: cell) else { return }
        posts.remove(at: cellIndexPath.row)
        posts.insert(post, at: cellIndexPath.row)
        tableView.reloadRows(at: [cellIndexPath], with: .bottom)
    }
}

// MARK: - Table view data source & delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell:PostTableViewCell
        
        if post.postImage == nil {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
            
        } else if post.text == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "ImageTextTableViewCell", for: indexPath) as! ImageTextTableViewCell
        }
        cell.configure(post: post, delegate: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let post = posts[indexPath.row]
        if post.postImage == nil {
            return 200
        }
        if post.text == nil {
            return 400
        }
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = posts[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.post = post
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

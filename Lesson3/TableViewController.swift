//
//  TableViewController.swift
//  Lesson3
//
//  Created by Илья on 01.10.2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var postsTableView: UITableView!
    
    var posts: [Post] =
        [ Post(nickname:"davidjohnson", description:"hello all, that's my first post here, Look at this photo!", picture: UIImage(named:"photo3") ?? UIImage()),
          Post(nickname:"bestest1", description:"ur favorite playlist, which you never listened to", picture: nil),
          Post(nickname:"voxsie", description:"I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, ", picture: UIImage(named: "somephoto1") ?? UIImage()),
          Post(nickname:"i.zheltikov", description:"needs no explanation", picture: UIImage(named: "somephoto2") ?? UIImage()),
          Post(nickname:"emiljan", description: "", picture: UIImage(named: "somephoto3")),
          Post(nickname:"vxsvxsvxs", description:"is this the moment I've been waiting for? Hurrah! Nope.", picture: nil),
          Post(nickname:"globalball", description:"What's your choise: :) or (: ???", picture: nil),
          Post(nickname:"firstmanhere", description:"but I like this social network more than twitter....", picture: nil),
          Post(nickname:"firstmanhere", description:"opps, it isn't", picture: nil),
          Post(nickname:"firstmanhere", description:"is the twitter?", picture: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTableView.dataSource = self
        postsTableView.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension TableViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                
        let post = posts[indexPath.row]
            
        if post.picture == nil {
            return 300
        } else if post.description == "" {
            return 350
        }
        return 520
    }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController
            secondViewController?.post = posts[indexPath.row]
            navigationController?.pushViewController(secondViewController!, animated: true)
        }
}

extension TableViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let post = posts[index]
        
        if post.picture == nil {
            guard let postCell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as? TextTableViewCell else { return UITableViewCell() }
            
            postCell.setData(post: posts[index])
            return postCell
        }
        
        if post.description == "" {
            guard let postCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
            
            postCell.setData(post: posts[index])
            return postCell
        }
        guard let postCell = tableView.dequeueReusableCell(withIdentifier: "ImageTextTableViewCell", for: indexPath) as? ImageTextTableViewCell else { return UITableViewCell() }
        
        postCell.setData(post: posts[index])
        return postCell
    }
}

struct Post {
    let nickname: String
    let description: String
    let picture: UIImage?
}

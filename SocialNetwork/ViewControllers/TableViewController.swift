//
//  TableViewController.swift
//  SocialNetwork
//
//  Created by Илья on 05.10.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var postsTableView: UITableView!
    
    var posts: [Post] =
        [ Post(username:"davidjohnson", description:"hello all, that's my first post here, \nLook at this photo!", picture: UIImage(named:"photo3") ?? UIImage(), profile_picture: UIImage(named:"photo3")),
          Post(username:"bestest1", description:"ur favorite playlist, \nwhich you never listened to", picture: nil, profile_picture: UIImage(named:"photo3")),
          Post(username:"voxsie", description:"I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad, I am not mad", picture: UIImage(named: "somephotos1") ?? UIImage(), profile_picture: UIImage(named:"photo3")),
          Post(username:"i.zheltikov", description:"needs \nno \nexplanation", picture: UIImage(named: "somephotos2") ?? UIImage(), profile_picture: UIImage(named:"somephotos2")),
          Post(username:"emiljan", description: "good morning all! That's really good start of day! I enjoyed it. I wish you to feel the same. Unforgetable for me....", picture: UIImage(named: "somephotos3"), profile_picture: UIImage(named:"somephotos3")),
          Post(username:"vxsvxsvxs", description:"is this the moment I've been waiting for? Hurrah! Nope.", picture: nil, profile_picture: UIImage(named:"somephotos1")),
          Post(username:"globalball", description:"What's your choise: \n :) or (: ???", picture: nil, profile_picture: UIImage(named: "person.circle.icon")),
          Post(username:"firstmanhere", description:"but I like this social network more than twitter....", picture: nil, profile_picture: UIImage(named: "person.circle.icon")),
          Post(username:"firstmanhere", description:"opps, it isn't", picture: nil, profile_picture: UIImage(named: "person.circle.icon")),
          Post(username:"firstmanhere", description:"is the twitter?", picture: nil, profile_picture: UIImage(named: "person.circle.icon"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        postsTableView.dataSource = self
        postsTableView.delegate = self
        
        
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                
        let post = posts[indexPath.row]
            
        if post.picture == nil {
            return 175
        } else if post.description == "" {
            return 400
        }
        return 500
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController
            secondViewController?.post = posts[indexPath.row]
            navigationController?.pushViewController(secondViewController!, animated: true)
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    let username: String
    let description: String
    let picture: UIImage?
    let profile_picture: UIImage!
}

//
//  FeedViewController.swift
//  Lesson3
//
//  Created by Danil Gerasimov on 24.09.2021.
//

import UIKit

class FeedViewController: UIViewController{
    @IBOutlet weak var postsTableView: UITableView!
    var posts: [Post] = [Post(nameOfPost: "Bebek", postInfo: "вчера", avatarImagePost: "image1", postText: "Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов.", structPostImage: "image1"), Post(nameOfPost: "Bobek", postInfo: "вчера", avatarImagePost: "image1", postText: "123", structPostImage: "imag"), Post(nameOfPost: "Popka", postInfo: "вчера", avatarImagePost: "image1", postText: "", structPostImage: "image1"), Post(nameOfPost: "А что такое?", postInfo: "вчера", avatarImagePost: "image1", postText: "Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов. Пикабу́ — русскоязычное информационно-развлекательное сообщество. Один из самых популярных сайтов в рунете — 67-е место по России и 1526-е в мире по данным Alexa Internet; 44-е место по стране и 761-е в мире по данным SimilarWeb. В 2014 году Пикабу стал одним из первых сайтов, внесённых в реестр популярных блогов.", structPostImage: "ima")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.estimatedRowHeight = 60
    }
}
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {return UITableViewCell()}
        cell.configure(avatarImage: posts[indexPath.row].avatarImagePost, name: posts[indexPath.row].nameOfPost, postInfo: posts[indexPath.row].postInfo, postImage: posts[indexPath.row].structPostImage, postText: posts[indexPath.row].postText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postsTableView.deselectRow(at: indexPath, animated: true)
        guard let postViewController = storyboard?.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController else { return }
        postViewController.loadViewIfNeeded()
    
        postViewController.configure(avatarImage: posts[indexPath.row].avatarImagePost, name: posts[indexPath.row].nameOfPost, postInfo: posts[indexPath.row].postInfo, postImage: posts[indexPath.row].structPostImage, postText: posts[indexPath.row].postText)
        navigationController?.pushViewController(postViewController, animated: true)
    }
}

struct Post {
    let nameOfPost: String
    let postInfo: String
    let avatarImagePost: String
    let postText: String
    let structPostImage: String
}


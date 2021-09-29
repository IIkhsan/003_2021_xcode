//
//  TableViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

class TableViewController: UITableViewController {

    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image"), text: "Александр Усик победил Энтони Джошуа и стал чемпионом мира в супертяжёлом Бой, прошедший в Лондоне, продлился все 12 раундов. Все трое судей отдали Усику - 117:112, 116:112, 115:113. Таким образом, Усик завоевал титул мира по версиям Всемирной боксёрской ассоциации (WBA), Всемирной боксёрской  (WBO), Международной федерации (IBF) и боксёрской организации (IBO) в супертяжёлом весе.", image: nil))
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image"), text: "Александр Усик победил Энтони Джошуа и стал чемпионом мира в супертяжёлом Бой, прошедший в Лондоне, продлился все 12 раундов. Все трое судей отдали Усику - 117:112, 116:112, 115:113. Таким образом, Усик завоевал титул мира по версиям Всемирной боксёрской ассоциации (WBA), Всемирной боксёрской  (WBO), Международной федерации (IBF) и боксёрской организации (IBO) в супертяжёлом весе.", image: #imageLiteral(resourceName: "Image")))
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image"), text: "Александр Усик победил Энтони Джошуа и стал чемпионом мира в супертяжёлом Бой, прошедший в Лондоне, продлился все 12 раундов. Все трое судей отдали Усику - 117:112, 116:112, 115:113. Таким образом, Усик завоевал титул мира по версиям Всемирной боксёрской ассоциации (WBA), Всемирной боксёрской  (WBO), Международной федерации (IBF) и боксёрской организации (IBO) в супертяжёлом весе.", image: #imageLiteral(resourceName: "Image")))
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image"), text: "Александр Усик победил Энтони Джошуа и стал чемпионом мира в супертяжёлом Бой, прошедший в Лондоне, продлился все 12 раундов. Все трое судей отдали Усику - 117:112, 116:112, 115:113. Таким образом, Усик завоевал титул мира по версиям Всемирной боксёрской ассоциации (WBA), Всемирной боксёрской  (WBO), Международной федерации (IBF) и боксёрской организации (IBO) в супертяжёлом весе.", image: nil))
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image"), text: nil, image: #imageLiteral(resourceName: "Image")))
                
        tableView.registerCustomCell(PostTextTableViewCell.self)
        tableView.registerCustomCell(PostImageTableViewCell.self)
        tableView.registerCustomCell(PostTextImageTableViewCell.self)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let post = posts[indexPath.row]
        
        if post.image == nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTextTableViewCell.cellIdentifier(), for: indexPath) as? PostTextTableViewCell else { return PostTextTableViewCell()}
            cell.configure(post: post)
            return cell
        }
        else if post.text == nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostImageTableViewCell.cellIdentifier(), for: indexPath) as? PostImageTableViewCell else { return PostImageTableViewCell()}
            cell.configure(post: post)
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTextImageTableViewCell.cellIdentifier(), for: indexPath) as? PostTextImageTableViewCell else { return PostTextImageTableViewCell()}
            cell.configure(post: post)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = posts[indexPath.row]
        
        performSegue(withIdentifier: "detailIdentifier", sender: post)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailIdentifier", let post = sender as? Post {
            
            let destinationController = segue.destination as? DetailsViewController
            
            destinationController?.post = post
        }
    }
}

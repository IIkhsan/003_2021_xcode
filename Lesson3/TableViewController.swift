//
//  TableViewController.swift
//  Lesson3
//
//  Created by Alina Bikkinina on 27.09.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var posts: [News] = [NewsWithImage.init(groupTitle: "Как я встретил столбняк", groupImg: UIImage.init(named: "g1") ?? UIImage(), postTime: "8:15", postText: "hup", hasImage: true, postImage: UIImage.init(named: "p1") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Новости"
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "TestCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TestTableViewCell")
        
//        self.tableView.register(TestTableViewCell.self, forCellReuseIdentifier: "TestTableViewCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentPost = posts[indexPath.row]

        if currentPost.hasImage {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as? TestTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setData(postInfo: currentPost as! NewsWithImage)
            return cell
        }
        
        let newCell = TextNewsTableViewCell()
        newCell.setData(postInfo: currentPost)
        return newCell
        }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            posts[indexPath.row].hasImage ? 582 : 250
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let currentPost = posts[indexPath.row]

        if currentPost.hasImage {
            let imageScreenStoryboard = UIStoryboard(name: "ImageScreen",bundle: nil)
            guard let imagePostViewController = imageScreenStoryboard.instantiateViewController(withIdentifier: "ImagePostViewController") as? ImagePostViewController else { return }
            imagePostViewController.post = posts[indexPath.row] as! NewsWithImage
            present(imagePostViewController, animated: true)
        }
        
        let textScreenStoryboard = UIStoryboard(name: "TextScreen",bundle: nil)
        guard let textPostViewController = textScreenStoryboard.instantiateViewController(withIdentifier: "TextPostViewController") as? TextPostViewController else { return }
        textPostViewController.post = posts[indexPath.row]
        present(textPostViewController, animated: true)
    }
}

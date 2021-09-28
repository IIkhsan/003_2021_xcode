//
//  TableViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

class TableViewController: UITableViewController {

    let posts: [Post] = [Post(username: "Alex", textpost: "hello", picture: UIImage(named: "image1")),
                               .init(name: "Mikal", textpost: "hello", picture: UIImage(named: "image1")),
                               .init(name: "Bulat", textpost: "hello", picture: UIImage(named: "image1")),
                               .init(name: "Marat", textpost: "hello", picture: UIImage(named: "image1"))]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = posts[indexPath.row].username
        cell.detailTextLabel?.text = posts[indexPath.row].textpost
        cell.imageView?.image = posts[indexPath.row].picture

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

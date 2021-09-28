//
//  TableViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

class TableViewController: UITableViewController {

    let posts: [Post] = [.init(text: "Александр Усик победил Энтони Джошуа и стал чемпионом мира в супертяжёлом Бой, прошедший в Лондоне, продлился все 12 раундов. Все трое судей отдали Усику - 117:112, 116:112, 115:113. Таким образом, Усик завоевал титул мира по версиям Всемирной боксёрской ассоциации (WBA), Всемирной боксёрской  (WBO), Международной федерации (IBF) и боксёрской организации (IBO) в супертяжёлом весе.", image: UIImage(named: "Image")!)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell else { return UITableViewCell()}
                    
        cell.descriptionLabel.text = posts[indexPath.row].text
        cell.imagePost.image = posts[indexPath.row].image

        return cell
    }
}

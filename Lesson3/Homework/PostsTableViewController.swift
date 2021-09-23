//
//  PostsTableViewController.swift
//  Lesson3
//
//  Created by Даниил Багаутдинов on 22.09.2021.
//

import UIKit

@available(iOS 15, *)
class PostsTableViewController: UITableViewController {
    
    
    var textArray: [String] = []
    var data: [PostsCellData] = []
    
    let communitieNames = ["Cказки на ночь", "Сказки на утро", "Сказки на день","Сказки на жизнь", "Сказки без настроения", "Сказки с душой","Сказочное чудо","Просто сказки", "Сказки - веселье", "Сказочное было детство"]
    let communitieImages = ["1", "2", "3", "4","5"]
    let postImages = ["6","7","8","9","10","11","12","13"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    // MARK: - Configure
    private func configure() {
        readFromFile()
        data = [PostsCellData(communitie: communitieNames[0], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[0], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[1], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[1], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[2], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[2], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[3], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[3], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[4], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[4], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[5], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[5], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[6], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[6], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[7], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[7], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[8], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[8], postImage: UIImage(named:postImages.randomElement() ?? "6")),
                PostsCellData(communitie: communitieNames[9], communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: Date.now.description, article: textArray[9], postImage: UIImage(named:postImages.randomElement() ?? "6"))]
        
        tableView.dataSource = self
        
    }
    // MARK: - Table view data source
    
    func readFromFile() {
        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
            if let text = try? String(contentsOfFile: path) {
                textArray = text.components(separatedBy: "\n\n")
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        450
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as? PostsTableViewCell else { return UITableViewCell() }
        cell.setData(post: data[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postCellData = data[indexPath.row]
        performSegue(withIdentifier: "segueFullInformation", sender: postCellData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFullInformation", let viewController = segue.destination as? FullInformationViewController, let postCellData = sender as? PostsCellData {
            viewController.postCellData = postCellData
        }
    }
}

struct PostsCellData {
    let communitie: String
    let communitieImage: UIImage?
    let publicationDate: String
    let article: String
    let postImage: UIImage?
}

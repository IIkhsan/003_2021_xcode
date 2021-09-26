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
    var postsData: [PostCellData] = []
    var picturePostsData: [PicturePostCellData] = []
    
    let communitieNames = ["Cказки на ночь", "Сказки на утро", "Сказки на день","Сказки на жизнь", "Сказки без настроения", "Сказки с душой","Сказочное чудо","Просто сказки", "Сказки - веселье", "Сказочное было детство"]
    let communitieNames2 = ["Картинки", "Красочные картинки", "Это искусство", "Искусство", "Каркарыч"]
    let communitieImages = ["1", "2", "3", "4","5"]
    let postImages = ["6","7","8","9","10","11","12","13"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        readFromFile()
        
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 3*60*60)
        let formatteddate = formatter.string(from: time as Date)
        
        picturePostsData = communitieNames2.map { PicturePostCellData(communitie: $0, communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: "\(formatteddate)", postImage: UIImage(named: communitieImages.randomElement() ?? "1")) }
        
        postsData = textArray.map { PostCellData(communitie: communitieNames.randomElement() ?? "Красиво", communitieImage: UIImage(named: communitieImages.randomElement() ?? "1"), publicationDate: "\(formatteddate)", article: $0, postImage: UIImage(named:postImages.randomElement() ?? "6")) }
        
    }
    
    func readFromFile() {
        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
            if let text = try? String(contentsOfFile: path) {
                textArray = text.components(separatedBy: "\n\n")
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData.count + picturePostsData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        450
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < postsData.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as? PostsTableViewCell else { return UITableViewCell() }
            cell.setData(post: postsData[indexPath.row])
            return cell

        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PicturePostTableViewCell", for: indexPath) as? PicturePostTableViewCell else { return UITableViewCell() }
            cell.setData(post: picturePostsData[indexPath.row - postsData.count])
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < postsData.count {
            let postCellData = postsData[indexPath.row]
            performSegue(withIdentifier: "segueFullInformationPost", sender: postCellData)
        } else {
            let picturePostCellData = picturePostsData[indexPath.row - postsData.count]
            performSegue(withIdentifier: "segueFullInformationPicturePost", sender: picturePostCellData)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueFullInformationPost", let viewController = segue.destination as? FullInformationViewController, let postCellData = sender as? PostCellData {
            viewController.postCellData = postCellData
        }
        if segue.identifier == "segueFullInformationPicturePost", let viewController = segue.destination as? PictureFullInformationViewController, let picturePostCellData = sender as? PicturePostCellData {
            viewController.picturePostCellData = picturePostCellData
        }
    }
}

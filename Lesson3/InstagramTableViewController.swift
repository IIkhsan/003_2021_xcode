//
//  InstagramTableViewController.swift
//  Lesson3
//
//  Created by Tagir Kabirov on 28.09.2021.
//

import UIKit

class InstagramTableViewController: UITableViewController {

    var sizeNumber: Int = 0
    var images: [UIImage] = []
    var posts:[UITableViewCell] = []
    let typesOfPost = [ "postWithoutText", "postOnlyWithText", "postWithText"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...11 {
            images.append(UIImage(named: "post_img_\(i)") ?? UIImage())
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 10...15)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = typesOfPost[Int.random(in: 0..<typesOfPost.count)]
        switch type {
        case "postWithoutText":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: type, for: indexPath) as? PostWithoutTextCell else { return UITableViewCell()}
            sizeNumber = 600
            cell.configure(post: Post(postImg: images[Int.random(in: 0..<images.count)], postText: Text.getText()))
            return cell
        case "postWithText":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: type, for: indexPath) as? PostWithTextCell else { return UITableViewCell()}
            sizeNumber = 700
            cell.configure(post: Post(postImg: images[Int.random(in: 0..<images.count)], postText: Text.getText()))
            return cell
        case "postOnlyWithText":
            guard let cell = tableView.dequeueReusableCell(withIdentifier: type, for: indexPath) as? PostOnlyWithTextCell else { return UITableViewCell()}
            sizeNumber = 200
            cell.configure(post: Post(postImg: images[Int.random(in: 0..<images.count)], postText: Text.getText()))
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(sizeNumber)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ImageAndTextSegue", sender: tableView.cellForRow(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ImageAndTextSegue",
            let viewController = segue.destination as? ImageAndTextViewController,
                let postInf = sender as? PostWithTextCell {
                    let post = postInf.post
            viewController.imgSegue = post.postImg
            viewController.textSegue = post.postText
                }

        if segue.identifier == "ImageSegue",
            let viewController = segue.destination as? ImageViewController,
                let postInf = sender as? PostWithoutTextCell {
                    let post = postInf.post
            viewController.imgSegue = post.postImg
                }

        if segue.identifier == "TextSegue",
            let viewController = segue.destination as? TextViewController,
                let postInf = sender as? PostOnlyWithTextCell {
                    let post = postInf.post
            viewController.textSegue = post.postText
                }
    }
}

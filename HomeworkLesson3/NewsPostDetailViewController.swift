//
//  NewsPostDetailViewController.swift
//  Lesson3
//
//  Created by Arslan Rashidov on 30.09.2021.
//

import UIKit

class NewsPostDetailViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    
    var newsPost: newsPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let newsPost = newsPost else {
            return
        }
        configure(newsPost: newsPost)
    }
    
    func configure(newsPost: newsPost) {
        textLabel.text = newsPost.text
        photoImageView.image = newsPost.image
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

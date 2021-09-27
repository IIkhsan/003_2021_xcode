//
//  PostViewController.swift
//  Lesson3
//
//  Created by Danil Gerasimov on 26.09.2021.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postInfoLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configure(avatarImage: String, name: String, postInfo: String, postImage: String, postText: String){
        print(self.avatarImage)
        self.avatarImage.image = UIImage(named: avatarImage)
        nameLabel.text = name
        postInfoLabel.text = postInfo
        self.postImage.image = UIImage(named: postImage)
        postTextLabel.text = postText
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

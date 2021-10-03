//
//  PostViewController.swift
//  Lesson3
//
//  Created by Илья on 01.10.2021.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post!
    
    
    @IBOutlet weak var postPicture: UIImageView!
    @IBOutlet weak var postUsername: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = post.nickname
        
        postPicture?.image = post.picture
        postUsername.text = post.nickname
        postDescription.text = post.description
        // Do any additional setup after loading the view.
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

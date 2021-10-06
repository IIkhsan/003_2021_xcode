//
//  PostViewController.swift
//  SocialNetwork
//
//  Created by Илья on 05.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post!

    @IBOutlet weak var postPicture: UIImageView!
    @IBOutlet weak var postUsername: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = post.username
        
        postPicture?.image = post.picture
        postUsername.text = post.username
        postDescription.text = post.description
        
        if postPicture?.image == nil {
            
        }
        
        if postPicture?.image == nil {
            self.postUsername.frame.origin.y -= 375
            self.postDescription.frame.origin.y -= 375
        }
    }
    
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



//
//  DetailViewController.swift
//  ThirdLesson
//
//  Created by Renat Murtazin on 28.09.2021.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    
    var post: PostStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileLabel.text = post?.profileLabel
        profileImageView.image = post?.profileImage
        postImageView.image = post?.postImage
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

//
//  SecondDetailViewController.swift
//  ThirdLesson
//
//  Created by Renat Murtazin on 28.09.2021.
//

import UIKit

class SecondDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    
    var post: PostStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.image = post?.profileImage
        profileLabel.text = post?.profileLabel
        postTextView.text = post?.postText
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

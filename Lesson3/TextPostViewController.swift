//
//  TextPostViewController.swift
//  Lesson3
//
//  Created by Alina Bikkinina on 27.09.2021.
//

import UIKit

class TextPostViewController: UIViewController {
    
    @IBOutlet weak var groupTitleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var groupImmageView: UIImageView!
    
    @IBOutlet weak var postTextView: UITextView!
    
    var post: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupTitleLabel.text = post?.groupTitle
        dateLabel.text = post?.postTime
        groupImmageView.image = post?.groupImg
        postTextView.text = post?.postText
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

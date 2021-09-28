//
//  NewsWithImage.swift
//  Lesson3
//
//  Created by Alina Bikkinina on 26.09.2021.
//

import Foundation
import UIKit


class NewsWithImage: News {
    
    var postImage: UIImage
    
    init(groupTitle: String, groupImg: UIImage, postTime: String, postText: String, hasImage: Bool, postImage: UIImage) {
        self.postImage = postImage
        super.init(groupTitle: groupTitle, groupImg: groupImg, postTime: postTime, postText: postText, hasImage: hasImage)
    }
}

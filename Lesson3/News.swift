//
//  NewsWithImg.swift
//  Lesson3
//
//  Created by Alina Bikkinina on 26.09.2021.
//
import Foundation
import UIKit

class News {
    var groupTitle: String
    
    var groupImg: UIImage
    
    var postTime: String
    
    var postText: String
    
    var hasImage: Bool
    
    init(groupTitle: String, groupImg: UIImage, postTime: String, postText: String, hasImage: Bool) {
        
        self.groupTitle = groupTitle
        self.groupImg = groupImg
        self.postTime = postTime
        self.postText = postText
        self.hasImage = hasImage
    }
}


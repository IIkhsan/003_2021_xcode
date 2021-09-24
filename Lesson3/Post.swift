//
//  Post.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 24.09.2021.
//

import Foundation
import UIKit

struct Post {
    let content: String
    let contentImage: UIImage?
    let authorImage: UIImage
    let authorName: String
    var likesCount: Int
    var commentsCount: Int
    var repostCount: Int
    let date: Date
}

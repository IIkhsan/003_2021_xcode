//
//  Post.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 27.09.2021.
//

import UIKit

struct Post {
    let author: Author
    var time = Date()
    var content: String? = nil
    var image: UIImage? = nil
    
    var type: PostType {
        if content != nil && image == nil {
            return .contentOnly
        } else if image != nil && content == nil {
            return .imageOnly
        } else if image != nil && content != nil {
            return .both
        } else {
            fatalError("Post must contain either content or image or both")
        }
    }
    
}

enum PostType {
    case imageOnly, contentOnly, both
}

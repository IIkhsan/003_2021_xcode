//
//  ProfileModel.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 13.10.2021.
//

import Foundation

class ProfileModel: FeedModel {
    //MARK: - Properties
    var user: User?
    
    //MARK: - public functions
    override func requireData() {
        dataServive.requireUser(completion: { user in
            self.user = user
            self.delegate?.dataUpdated()
        })
        dataServive.requireArrayOfPosts(completion: { posts in
            self.posts = posts
            self.delegate?.dataUpdated()
        })
    }
}

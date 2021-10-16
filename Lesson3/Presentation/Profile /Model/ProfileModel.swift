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
        dataService.requireUser(completion: { user in
            self.user = user
            self.delegate?.dataUpdated()
        })
        dataService.requireArrayOfPosts(completion: { posts in
            self.posts = posts
            self.delegate?.dataUpdated()
        })
    }
}

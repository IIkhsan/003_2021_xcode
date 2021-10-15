//
//  ProfileModel.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 13.10.2021.
//

import Foundation

class ProfileModel {
    //MARK: - Properties
    var user: User?
    var dataService = DataService()
    var delegate: FeedModelDelegate
    //MARK: - public functions
    init(delegate: FeedModelDelegate) {
        self.delegate = delegate
    }
    
    func requireData() {
        dataService.requireUser(completion: { user in
            self.user = user
            self.delegate.dataUpdated()
        })
        dataService.requireArrayOfPosts(completion: { posts in
            self.user?.posts = posts
            self.delegate.dataUpdated()
        })
    }
}

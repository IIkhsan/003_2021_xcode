//
//  DataService.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 13.10.2021.
//

import Foundation
class DataService {
    
    //MARK: - Properties
    private var dataGenerator = DataGenerator()
    
    //MARK: - Functions
    func requireUser(completion: @escaping (User) -> Void) {
        sleep(3)
        completion(dataGenerator.generateUser())
    }
    
    func requireArrayOfPosts(completion: @escaping ([Post]) -> Void) {
        sleep(3)
        completion(dataGenerator.generateArrayOfPosts(count: 28))
    }
}

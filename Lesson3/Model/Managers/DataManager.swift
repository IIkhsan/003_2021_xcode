//
//  DataManager.swift
//  Lesson3
//
//  Created by Роман Сницарюк on 22.09.2021.
//

import Foundation
import UIKit

class DataManager {
    //MARK: - Variables
    private let photos = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5", "avatar6"]
    // генерация текста - https://yandex.ru/lab/yalm
    private let text = ["Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.", "Gg", "ios это система, которая позволяет вам чувствовать себя более умным с течением времени. У меня, к примеру, ios 10.2! Я уже 2 раз обновился и чувствую себя умнее! Даже моя собака говорит, что я умнее! Мой брат, как-то раз, решил поиграть в эту игру. Это было очень весело, так как он играл весь вечер и так и не прошел до конца!", "Математика не самая сложная наука, если вы знаете, как ее правильно применять.", "матан - это то, что не поддается логике."]
    private let nicks = ["sixz.r", "asda.sd", "el.primo", "welcome"]
    
    //MARK: - Generating
    func generatePosts(_ count: Int) -> [Post] {
        var posts = [Post]()
        for _ in 1...count {
            if let post = generatePost() {
                posts.append(post)
            }
        }
        return posts
    }
    
    private func generatePost() -> Post? {
        guard let author = generateAuthor() else { return nil }
        guard let photo = photos.compactMap({ UIImage(named: $0) }).randomElement() else { return nil }
        guard let text = text.randomElement() else { return nil }
        let randomTypeCouner = Int.random(in: 1...3)
        let post: Post
        switch randomTypeCouner {
        case 1:
            post = Post(author: author, image: nil, text: text)
        case 2:
            post = Post(author: author, image: photo, text: nil)
        case 3:
            post = Post(author: author, image: photo, text: text)
        default:
            fatalError()
        }
        return post
    }
    
    private func generateAuthor() -> User? {
        guard let nick = nicks.randomElement() else { return nil }
        guard let photo = photos.compactMap({ UIImage(named: $0) }).randomElement() else { return nil }
        return User(name: nick, avatar: photo)
    }
}

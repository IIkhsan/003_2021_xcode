//
//  PostDelegate.swift
//  Lesson3
//
//  Created by Evans Owamoyo on 28.09.2021.
//

import UIKit

protocol PostCellDelegate: UITableViewCell {
    func loadData(with post: Post)
}

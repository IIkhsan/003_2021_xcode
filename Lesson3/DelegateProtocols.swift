//
//  DelegateProtocols.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 24.09.2021.
//

import Foundation
import UIKit

protocol PostTableViewCellDelegate: AnyObject {
    func likeTapped(sender: UITableViewCell)
    func likeCanceled(sender: UITableViewCell)
}

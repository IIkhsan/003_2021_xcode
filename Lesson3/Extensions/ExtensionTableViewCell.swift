//
//  ExtensionTableViewCell.swift
//  Lesson3
//
//  Created by Alexandr Onischenko on 29.09.2021.
//

import Foundation
import UIKit

protocol CustomCell {
    
    static func cellIdentifier() -> String
    
    static func cellNib() -> UINib?
}

extension UITableView{
    func registerCustomCell(_ cell: CustomCell.Type) {
        self.register(cell.cellNib(), forCellReuseIdentifier: cell.cellIdentifier())
    }
}

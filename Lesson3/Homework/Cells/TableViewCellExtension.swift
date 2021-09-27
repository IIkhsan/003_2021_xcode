//
//  TableViewCellExtension.swift
//  Lesson3
//
//  Created by Руслан on 29.07.2021.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static func getNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func getIdentifier() -> String {
        return String(describing: self)
    }
}

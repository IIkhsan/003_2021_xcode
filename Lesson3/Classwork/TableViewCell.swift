//
//  TableViewCell.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didTapButton(student: Student, cell: UITableViewCell)
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var groupNumberLabel: UILabel!
    
    var student: Student?
    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(student: Student, delegate: TableViewCellDelegate) {
        studentNameLabel.text = student.name
        groupNumberLabel.text = student.groupNumber
        self.student = student
        self.delegate = delegate
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        guard var student = student else { return }
        student.groupNumber = "13-123"
        delegate?.didTapButton(student: student, cell: self)
    }
    
}

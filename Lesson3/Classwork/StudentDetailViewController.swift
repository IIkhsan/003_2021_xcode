//
//  StudentDetailViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

protocol StudentDetailViewControllerDelegate: AnyObject {
    func onDataChange(student: Student)
}

class StudentDetailViewController: UIViewController {
    
    // UI
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var groupNumberLabel: UILabel!
    
    // Properties
    var student: Student?
    weak var delegate: StudentDetailViewControllerDelegate?

    // - MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    // Private methods
    private func configure() {
        guard var student = student else { return }
        
        nameLabel.text = student.name
        groupNumberLabel.text = student.groupNumber
        
        student.groupNumber = "11-805"
        
        delegate?.onDataChange(student: student)
    }
}

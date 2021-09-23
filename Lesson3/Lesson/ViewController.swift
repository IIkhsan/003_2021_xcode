//
//  ViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var students: [Student] = [Student(name: "Alex", groupNumber: "11-108"),
                               .init(name: "Mikal", groupNumber: "11-205"),
                               .init(name: "Bulat", groupNumber: "12-304"),
                               .init(name: "Marat", groupNumber: "11-103")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func navigation() {
        
    }
}

extension ViewController: StudentDetailViewControllerDelegate {
    func onDataChange(student: Student) {
        students.append(student)
        tableView.reloadData()
    }
}

extension ViewController: TableViewCellDelegate {
    func didTapButton(student: Student, cell: UITableViewCell) {
        guard let cellIndexPath = tableView.indexPath(for: cell) else { return }
        students.remove(at: cellIndexPath.row)
        students.insert(student, at: cellIndexPath.row)
        tableView.reloadRows(at: [cellIndexPath], with: .bottom)
    }
}
  
// MARK: - Table view data source & delegate
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! TableViewCell
        
        cell.configure(student: students[indexPath.row], delegate: self)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = students[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "StudentDetailViewController") as! StudentDetailViewController
        vc.student = student
        navigationController?.pushViewController(vc, animated: true)
//        performSegue(withIdentifier: "segueIdentifier", sender: student)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
//        if segue.identifier == "segueIdentifier",
//           let viewController = segue.destination as? StudentDetailViewController,
//           let student = sender as? Student {
//
//            viewController.student = student
//            viewController.delegate = self
//        }
    }
    
}


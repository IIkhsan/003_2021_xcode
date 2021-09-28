//
//  ViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var [posts]: Post = [Post(username: "Alex", textpost: "hello", picture: UIImage(named: "image1")),
    .init(name: "Mikal", textpost: "hello", picture: UIImage(named: "image1")),
    .init(name: "Bulat", textpost: "hello", picture: UIImage(named: "image1")),
    .init(name: "Marat", textpost: "hello", picture: UIImage(named: "image1"))]
    
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
    func onDataChange(post: Post) {
        posts.append(post)
        tableView.reloadData()
    }
}

extension ViewController: TableViewCellDelegate {
    func didTapButton(post: Post, cell: UITableViewCell) {
        guard let cellIndexPath = tableView.indexPath(for: cell) else { return }
        posts.remove(at: cellIndexPath.row)
        students.insert(post, at: cellIndexPath.row)
        tableView.reloadRows(at: [cellIndexPath], with: .bottom)
    }
}
  
// MARK: - Table view data source & delegate
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! TableViewCell
        
        cell.configure(student: posts[indexPath.row], delegate: self)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = [indexPath.row]
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


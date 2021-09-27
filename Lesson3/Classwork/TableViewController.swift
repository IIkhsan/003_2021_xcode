//
//  TableViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

class TableViewController: UITableViewController {

    let students: [Student] = [Student(name: "Alex", groupNumber: "11-108"),
                               .init(name: "Mikal", groupNumber: "11-205"),
                               .init(name: "Bulat", groupNumber: "12-304"),
                               .init(name: "Marat", groupNumber: "11-103")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = students[indexPath.row].name
        cell.detailTextLabel?.text = students[indexPath.row].groupNumber
        cell.imageView?.image = #imageLiteral(resourceName: "image1")

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
}
extension ViewController: ImageTextDetailViewControllerDelegate {
    func onDataChange(publication: Publication) {
        publications.append(publication)
        tableView.reloadData()
    }
}
extension ViewController: ImageDetailViewControllerDelegate {
    func refreshTable() {
        tableView.reloadData()
    }
}
extension ViewController: TextDetailViewControllerDelegate {
}

  
// MARK: - Table view data source & delegate
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return publications.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let publication = publications[indexPath.row]
        if publication.mainText != nil && publication.mainImage != nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextImageTableViewCell", for: indexPath) as? TextImageTableViewCell else { return UITableViewCell()}
            cell.configure(publication: publications[indexPath.row]) //delegate
            return cell
        } else if publication.mainText == nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell else { return UITableViewCell()}
            cell.configure(publication: publications[indexPath.row]) //delegate
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as? TextTableViewCell else { return UITableViewCell()}
            cell.configure(publication: publications[indexPath.row]) //delegate
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let publication = publications[indexPath.row]
        if publication.mainImage == nil {
            return 250
        }
        if publication.mainText == nil {
            return 390
        }
        return 450
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let publication = publications[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        if publication.mainImage != nil && publication.mainText != nil {
            guard let imageTextViewController = storyboard?.instantiateViewController(withIdentifier: "ImageTextDetailViewController") as? ImageTextDetailViewController else {return}
            imageTextViewController.delegate = self
            imageTextViewController.publication = publication
            navigationController?.pushViewController(imageTextViewController, animated: true)
        } else if publication.mainText == nil {
            guard let imageViewController = storyboard?.instantiateViewController(withIdentifier: "ImageDetailViewController") as? ImageDetailViewController else {return}
            imageViewController.delegate = self
            imageViewController.publication = publication
            navigationController?.pushViewController(imageViewController, animated: true)
        } else  {
            guard let textViewController = storyboard?.instantiateViewController(withIdentifier: "TextDetailViewController") as? TextDetailViewController else {return}
            textViewController.delegate = self
            textViewController.publication = publication
            navigationController?.pushViewController(textViewController, animated: true)
        }
    }
}


//
//  LentaViewController.swift
//  vknews
//
//  Created by itisioslab on 27.09.2021.
//

import UIKit

class LentaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var Info: [SinglePostCellData] = [SinglePostCellData(groupName: "insanity gallery",
                                                         description: "Работа была спроектирована и вылеплена Симоне гаммино.",
                                                         groupImage: UIImage(named: "IMG_7611") ?? UIImage(),
                                                         publishingTime: "24 сен в 12:22 АМ",
                                                         pinnedPics: [UIImage(named: "IMG_7608") ?? UIImage(), UIImage(named: "IMG_7606") ?? UIImage(), UIImage(named:"IMG_7609") ?? UIImage(), UIImage(named:"IMG_76110") ?? UIImage()]),
                                      SinglePostCellData(groupName: "на дальней станции сойду",
                                                         description: "железная дорога через озеро в алтайском крае.",
                                                         groupImage: UIImage(named: "IMG_7613") ?? UIImage(),
                                                         publishingTime: "23 мая в 9:57 АМ",
                                                         pinnedPics: [UIImage(named:"IMG_7612") ?? UIImage()]),
                                      SinglePostCellData(groupName: "GIRL MEMES",
                                                         description: "",
                                                         groupImage: UIImage(named: "IMG_7615") ?? UIImage(),
                                                         publishingTime:"15 мая в 3:55 РМ",
                                                         pinnedPics: [UIImage(named: "IMG_7614") ?? UIImage()]),
                                      SinglePostCellData(groupName: "ART casket",
                                                         description: "Я почти продал душу, но сделал это...",
                                                         groupImage: UIImage(named: "IMG_7618") ?? UIImage(),
                                                         publishingTime: "1 мая в 10:30 АМ",
                                                         pinnedPics: [UIImage(named: "IMG_7616") ?? UIImage(), UIImage(named: "IMG_7617") ?? UIImage()]),
                                      SinglePostCellData(groupName: "GOLD KARDASHIANS",
                                                         description: "Лана, ловящая трусики фанаток, как отдельный вид искусства",
                                                         groupImage: UIImage(named: "IMG_7621") ?? UIImage(),
                                                         publishingTime: "28 апр в 10:25 АМ",
                                                         pinnedPics: [UIImage(named: "IMG_7620") ?? UIImage(), UIImage(named: "IMG_7619") ?? UIImage()])]
    
   override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
   }
}

extension LentaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        cell.SetData(post: Info[indexPath.row])
        return cell
    }
}
    
extension LentaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 501
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailedPostViewController = storyboard.instantiateViewController(withIdentifier: "DetailedPostViewController") as? DetailedPostViewController else { return }
        navigationController?.pushViewController(detailedPostViewController, animated: true)
        detailedPostViewController.post = Info[indexPath.row]

    }
}

struct SinglePostCellData {
    var groupName: String
    var description: String
    var groupImage: UIImage
    var publishingTime: String
    var pinnedPics: [UIImage]
}


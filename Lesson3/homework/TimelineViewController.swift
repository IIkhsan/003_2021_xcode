//
//  TimelineViewController.swift
//  Lesson3
//
//  Created by Милана Махсотова on 26.09.2021.
//

import UIKit

class TimelineViewController: UIViewController, PostDetailViewControllerDelegate {
   
    

    fileprivate let cellIndentifier = "myCellIdentifier"
    
    let images = ["image1.png", "image2.png", "image3.png", "image4.jpeg", "image5.jpeg", "image6.jpeg"]
    
    let descriptions = [ "На комиссии на третьем курсе могут отчислить, если учишься на платном? Анон",
    "Кто такие айтишники? 💻 Наверное, каждый слышал это слово и сам не раз применял в отношении человека, который, так и ли иначе, связан с компьютерами. Но есть множество разных профессий в сфере ИТ - разработчики, аналитики, системные администраторы, тестировщики и т.д. Объясняем в новом выпуске программы Мастера чем отличаются и чем схожи все эти профессии и кто же всё-таки такие айтишники В съемках приняли участие: Михаил Абрамский, директор ИТИС, Булат Ганиев, управляющий партнер компании Технократия С нас стартовал новый сезон программы, она выходит каждую субботу на тк Россияи, похоже, что одним выпуском с нами сезон не ограничится! Увидимся еще😉 ",
    "Председатель Союза женщин предложила спросить россиянок, хотят ли они служить в армии"]
    
   
    let names = ["Milana", "Marat", "Elina"]
    
    var posts: [Post] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        takeAppereance()
    }
    
    private func configure() {
        let nib = UINib(nibName: "TableViewCellTimeline", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIndentifier )

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 88.0
        

        
        posts = [Post(author: names.randomElement()!, authorImage: UIImage(named: images.randomElement()!)!, image: nil, description: descriptions.randomElement()!),
            Post(author: names.randomElement()!, authorImage:UIImage(named: images.randomElement()!)!, image: UIImage(named: images.randomElement()!), description: descriptions.randomElement()!),
            
            Post(author: names.randomElement()!, authorImage:UIImage(named: images.randomElement()!)!, image: UIImage(named: images.randomElement()!), description: descriptions.randomElement()!)
            ]
        
    }
    
    private func takeAppereance() {
        view.backgroundColor = .systemGray
        navigationController?.navigationBar.barTintColor = UIColor.systemGray
    }
 
}

extension TimelineViewController: UITableViewDataSource, UITableViewDelegate {
    
    func onDataChange(post: Post) {
        posts.append(post)
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! TableViewCellTimeline
        
        let model = posts[indexPath.row]
        
        
        cell.prepareCell(post: model)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if posts[indexPath.row].image == nil {
            return 150
        }
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        performSegue(withIdentifier: "segueIdentifier", sender: post)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueIdentifier",
           let viewController = segue.destination as?  PostDetailViewController,
            
            let post = sender as? Post {
                viewController.post = post
                viewController.delegate = self
            }

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

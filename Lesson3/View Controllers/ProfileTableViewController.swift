//
//  ProfileTableViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 06.10.2021.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    //MARK: Properties
    var posts: [Post] = []
    var dataManager = DataManager()
    var layerManager = LayerManager()
    var user: User?
    
    //MARK: IBOutlers
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var subscribersCountLabel: UILabel!
    @IBOutlet weak var friendsCountLabel: UILabel!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = dataManager.generateUser()
        posts = dataManager.generateArrayOfPosts(count: 10)
        configureProfileHeaderView()
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
    }

    // MARK: Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    //MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(post: posts[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetailFromProfile", sender: indexPath)
    }
    
    //MARK: Functions
    private func configureProfileHeaderView() {
        avatarImageView.image = user?.avatarImage
        nameLabel.text = user?.name
        phoneNumberLabel.text = user?.phoneNumber
        cityLabel.text = "City: \(user?.city ?? "")"
        subscribersCountLabel.text = "Subscribers: \(user?.subscribersCount ?? 0)"
        friendsCountLabel.text = "Friends: \(user?.friendsCount ?? 0)"
        layerManager.makeViewRounded(view: avatarImageView)
    }
    
    
    //MARK: Navigations
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailFromProfile" {
            guard let detailVC = segue.destination as? DetailPostViewController else { return }
            guard let indexPath = sender as? IndexPath else { return }
            detailVC.post = posts[indexPath.row]
        }
    }
}

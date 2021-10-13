//
//  ProfileViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 11.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Properties
    var profileModel: ProfileModel!
    
    //MARK: IBOutlets
    @IBOutlet weak var profileView: ProfileView!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profileModel = ProfileModel(delegate: self)
        configureTableView()
        configureProfileView()
        profileModel.requireData()
    }
    
    //MARK: - Private functions
    private func configureProfileView() {
        profileView.configureProfileHeaderView(user: profileModel.user)
    }
    
    private func configureTableView() {
        profileView.tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailFromProfile" {
            guard let indexPath = sender as? IndexPath else { return }
            guard let detailViewController = segue.destination as? DetailPostViewController else { return }
            detailViewController.configure(post: profileModel.posts[indexPath.row])
        }
    }
}


//MARK: - Table View Data Source
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(post: profileModel.posts[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileModel.posts.count
    }
}


//MARK: - Table View Delegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetailFromProfile", sender: indexPath)
    }
}

//MARK: - Feed Model Delegate
extension ProfileViewController: FeedModelDelegate {
    func dataUpdated() {
        profileView.tableView.reloadData()
        configureProfileView()
    }
}

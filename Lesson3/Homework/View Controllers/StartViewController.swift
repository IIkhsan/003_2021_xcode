//
//  StartViewController.swift
//  Lesson3
//
//  Created by Руслан on 29.07.2021.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: UI
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var posts: [Post] = [
        Post(groupLogo: #imageLiteral(resourceName: "matt"), groupName: "mattdavella", date: "5 min ago", text: "Smiling on the outside but having a full-blown menty b on the inside 🙃", image: #imageLiteral(resourceName: "matt1")),
        Post(groupLogo: #imageLiteral(resourceName: "matt"), groupName: "mattdavella", date: "1 day ago", text: nil, image: #imageLiteral(resourceName: "matt4")),
        Post(groupLogo: #imageLiteral(resourceName: "matt"), groupName: "mattdavella", date: "2 days ago", text: "You may have heard the story before. I graduated college in 2010 with $97k in debt and the first thing I did was put about $18k on a brand new car (I never claimed to be the sharpest tool 🔨).\n\nBut what I did after getting into that mess was the important part. Little by little I chipped away at my loans until I finally could consider myself debt-free. A little bit of luck and a lot of hard work helped me do it in 4 years.\n\nNow I’m diver deeper than I ever have before into *how* I managed to do it. From cutting back on my expenses to the strategies I used to increase my income, I cover it all in this week’s 20 min YouTube video. Check out my bio for the link.", image: nil),
        Post(groupLogo: #imageLiteral(resourceName: "matt"), groupName: "mattdavella", date: "3 days ago", text: "Okay so I finalllyyyy tried yoga. And it’s not at all what I expected it to be. You can watch the full video on YouTube 🧘‍♂️", image: #imageLiteral(resourceName: "matt2")),
        Post(groupLogo: #imageLiteral(resourceName: "ali"), groupName: "aliabdaal", date: "1 week ago", text: "Hosted our first dinner party for the parents #adulting", image: #imageLiteral(resourceName: "ali2")),
        Post(groupLogo: #imageLiteral(resourceName: "ali"), groupName: "aliabdaal", date: "1 week ago", text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: nil),
        Post(groupLogo: #imageLiteral(resourceName: "ali"), groupName: "aliabdaal", date: "2 weeks ago", text: nil, image: #imageLiteral(resourceName: "ali6")),
        Post(groupLogo: #imageLiteral(resourceName: "ali"), groupName: "aliabdaal", date: "1 week ago", text: "If you can find enjoyment in the thing you’re doing you will automatically be more productive 📈\n\n#productivity #productive #fulfilment #lifeadvice #enjoyment", image: #imageLiteral(resourceName: "ali3")),
        Post(groupLogo: #imageLiteral(resourceName: "ali"), groupName: "aliabdaal", date: "2 weeks ago", text: "What's on your desk?\n\n#productivity #desksetup #deskinspo #workfromhome #lifestyle #wfh #desk", image: #imageLiteral(resourceName: "ali4")),
        Post(groupLogo: #imageLiteral(resourceName: "ali"), groupName: "aliabdaal", date: "3 days ago", text: "🤐", image: #imageLiteral(resourceName: "ali5")),
        Post(groupLogo: #imageLiteral(resourceName: "ali"), groupName: "aliabdaal", date: "1 day ago", text: "How To Maximise Your Downtime\n\nImagine what you could achieve if the time you spent scrolling was put into a hobby or project you love.\n\nClip taken from my YouTube video \"How I Built a $3 Million Business Part Time\"", image: nil)
    ]
    
    // MARK: View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TextTableViewCell.getNib(), forCellReuseIdentifier: TextTableViewCell.getIdentifier())
        tableView.register(ImageTableViewCell.getNib(), forCellReuseIdentifier: ImageTableViewCell.getIdentifier())
        tableView.register(TextImageTableViewCell.getNib(), forCellReuseIdentifier: TextImageTableViewCell.getIdentifier())
    }

}

// MARK: Table View Delegate
extension StartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = storyboard?.instantiateViewController(identifier: DetailViewController.getId()) as? DetailViewController else { return }
        
        detailViewController.post = posts[indexPath.row]
        
        navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Table View Data Source
extension StartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        
        if post.text != nil && post.image != nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextImageTableViewCell.self), for: indexPath) as? TextImageTableViewCell else { return UITableViewCell() }
            cell.configure(with: post, at: indexPath)
            return cell
        }
        if post.text != nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextTableViewCell.self), for: indexPath) as? TextTableViewCell else { return UITableViewCell() }
            cell.configure(with: post, at: indexPath)
            return cell
        }
        if post.image != nil {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImageTableViewCell.self), for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
            cell.configure(with: post, at: indexPath)
            return cell
        }
        
        return UITableViewCell()
    }
    
}

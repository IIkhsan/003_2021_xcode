import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var IMAGE: UIImageView!
    var posts: [Post] = []
    var cells: [CustomTableViewCellProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
        for _ in 0...9 {
            posts.append(createPost())
        }
    }
}

    
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CustomTableViewCellProtocol
        let post = posts[indexPath.row]
        
        if cells.count >= posts.count {
            cell = cells[indexPath.row]
        } else {
            let randomCell = Int.random(in: 0...1)
            
            if randomCell == 0 {
                guard let cellWithText = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
                cell = cellWithText
            } else {
                guard let cellWithPhoto = tableView.dequeueReusableCell(withIdentifier: "PhotoCustomTableViewCell", for: indexPath) as? PhotoCustomTableViewCell else { return UITableViewCell() }
                cell = cellWithPhoto
            }
            
            cells.append(cell)
        }
        
        cell.setPost(post: post)
    
        return cell as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 510
    }
    
    // Было бы хорошо сделать 2 конструктора для поста (первый для ячеек с текстом, второй - для ячеек без текста), но так как задание требует несколько видов ячеек, пришлось подгонять сами посты под ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        if cells[indexPath.row] is CustomTableViewCell{
            let vc = sb.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            vc.post = posts[indexPath.row]
            navigationController?.present(vc, animated: true, completion: nil)
        } else {
            let vc = sb.instantiateViewController(identifier: "PhotoDetailViewController") as! PhotoDetailViewController
            vc.post = posts[indexPath.row]
            navigationController?.present(vc, animated: true, completion: nil)
        }
    }
}

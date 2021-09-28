//
//  ViewController.swift
//  Thirdpair
//
//  Created by Тимур Миргалиев on 27.09.2021.
//

import UIKit

class Post {
    var avatar: String
    var textOfPost: String
    var name: String
    var imageOfOfPost: String
    
    init(foto: String, textInPost: String, nameOfPost: String, image: String) {
        avatar = foto
        textOfPost = textInPost
        name = nameOfPost
        imageOfOfPost = image
    }
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [Post] = []
    
    var posts: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.append(Post.init(foto: "image3", textInPost: "Дороги в Эквадоре практически идеальные, хотя населенные пункты выглядят очень бедно. На дорогах много интересных машин, например очень много грузовиков - древних Фордов, которые я никогда раньше не видел. А еще несколько раз на глаза попадались старенькие Жигули :) А еще если кого-то обгоняешь и есть встречная машина, она обязательно включает фары. На больших машинах - грузовиках и автобусах, обязательно красуется местный тюнинг: машины разукрашенные, либо в наклейках, и обязательно везде огромное множество светодиодов, как будто новогодние елки едут и переливаются всеми цветами.", nameOfPost: "Timur", image: "image4"))
        dataSource.append(Post.init(foto: "image2", textInPost: "", nameOfPost: "Ivan", image: "image3"))
        dataSource.append(Post.init(foto: "image1", textInPost: "asdasdasdasdasdasdasdasd", nameOfPost: "Petr", image: ""))
        
        tableView.estimatedRowHeight = 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(text: dataSource[indexPath.row].name, avatar: dataSource[indexPath.row].avatar , messageText: dataSource[indexPath.row].textOfPost, imagePost: dataSource[indexPath.row].imageOfOfPost)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        vc.post = dataSource[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}


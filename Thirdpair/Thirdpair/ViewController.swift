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
    var datePost: String
    
    init(foto: String, textInPost: String, nameOfPost: String, image: String, dateOfPost: String) {
        avatar = foto
        textOfPost = textInPost
        name = nameOfPost
        imageOfOfPost = image
        datePost = dateOfPost
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [Post] = []
    var posts: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.append(Post.init(foto: "image3", textInPost: "Дороги в Эквадоре практически идеальные, хотя населенные пункты выглядят очень бедно. На дорогах много интересных машин, например очень много грузовиков - древних Фордов, которые я никогда раньше не видел. А еще несколько раз на глаза попадались старенькие Жигули :) А еще если кого-то обгоняешь и есть встречная машина, она обязательно включает фары. На больших машинах - грузовиках и автобусах, обязательно красуется местный тюнинг: машины разукрашенные, либо в наклейках, и обязательно везде огромное множество светодиодов, как будто новогодние елки едут и переливаются всеми цветами.", nameOfPost: "Timur", image: "image4", dateOfPost: "3 days ago"))
        dataSource.append(Post.init(foto: "image2", textInPost: "", nameOfPost: "Ivan", image: "image3", dateOfPost: "5 days ago"))
        dataSource.append(Post.init(foto: "image1", textInPost: "Во все большем количестве российских изданий − как печатных, так и онлайновых − появляются объемные материалы особого типа, за которыми в журналистской среде закрепилось название «длинные тексты» (англ. – long forms) или лонгриды (от англ. − long read – материал, предназначенный для длительного прочтения, в отличие от маленькой заметки).Сразу же следует оговориться, что объем материала – хотя и наиболее заметная, но не ключевая характеристика лонгрида. Объемными могут быть и материалы других жанров, поэтому сам по себе большой объем текста вовсе не означает, что перед нами лонгрид. Как будет показано в исследовании, лонгриды отличает также особый подход к выбору темы, требования к качеству собранной информации и способ подачи материала.В исследовании предпринята попытка описать типологические характеристики лонгридов, разобрать особенности их подготовки, а также выявить распространенность лонгридов в современной российской прессе. Еще одной целью исследования является оценка перспектив этого жанра, о котором можно говорить если не как о сложившемся (в принятых на сегодняшний день в научной среде жанровых классификациях лонгрид отсутствует), то как о складывающемся и проникающем во все большее количество изданий.", nameOfPost: "Petr", image: "", dateOfPost: "8 days ago"))
        tableView.estimatedRowHeight = 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(text: dataSource[indexPath.row].name, avatar: dataSource[indexPath.row].avatar , messageText: dataSource[indexPath.row].textOfPost, imagePost: dataSource[indexPath.row].imageOfOfPost, dateOfPost: dataSource[indexPath.row].datePost)
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

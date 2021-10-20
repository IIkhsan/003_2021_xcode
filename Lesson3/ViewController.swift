//
//  ViewController.swift
//  Lesson3
//
//  Created by Тимур Миргалиев on 27.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [Post] = []
    var posts: Post?
    
    var imagesForPost: [String] = ["image1", "image2", "image3", "image4"]
    var namesForPost: [String] = ["Ivan", "Petr", "Timur", "Sasha", "Alex", "Danil"]
    var datesForPost: [String] = ["22.02.2021", "12.03.2021", "15.03.2021", "14.02.2021"]
    var textsForPost: [String] = ["Дороги в Эквадоре практически идеальные, хотя населенные пункты выглядят очень бедно. На дорогах много интересных машин, например очень много грузовиков - древних Фордов, которые я никогда раньше не видел. А еще несколько раз на глаза попадались старенькие Жигули :) А еще если кого-то обгоняешь и есть встречная машина, она обязательно включает фары. На больших машинах - грузовиках и автобусах, обязательно красуется местный тюнинг: машины разукрашенные, либо в наклейках, и обязательно везде огромное множество светодиодов, как будто новогодние елки едут и переливаются всеми цветами.", "Во все большем количестве российских изданий − как печатных, так и онлайновых − появляются объемные материалы особого типа, за которыми в журналистской среде закрепилось название «длинные тексты» (англ. – long forms) или лонгриды (от англ. − long read – материал, предназначенный для длительного прочтения, в отличие от маленькой заметки).Сразу же следует оговориться, что объем материала – хотя и наиболее заметная, но не ключевая характеристика лонгрида. Объемными могут быть и материалы других жанров, поэтому сам по себе большой объем текста вовсе не означает, что перед нами лонгрид. Как будет показано в исследовании, лонгриды отличает также особый подход к выбору темы, требования к качеству собранной информации и способ подачи материала.В исследовании предпринята попытка описать типологические характеристики лонгридов, разобрать особенности их подготовки, а также выявить распространенность лонгридов в современной российской прессе. Еще одной целью исследования является оценка перспектив этого жанра, о котором можно говорить если не как о сложившемся (в принятых на сегодняшний день в научной среде жанровых классификациях лонгрид отсутствует), то как о складывающемся и проникающем во все большее количество изданий."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<7 {
            createDefaultPost()
        }
        dataSource.append(Post.init(
            foto: imagesForPost.randomElement(),
            textInPost: nil,
            nameOfPost: namesForPost.randomElement(),
            image: imagesForPost.randomElement(),
            dateOfPost: datesForPost.randomElement()))
        dataSource.append(Post.init(
            foto: imagesForPost.randomElement(),
            textInPost: textsForPost.randomElement(),
            nameOfPost: namesForPost.randomElement(),
            image: nil,
            dateOfPost: datesForPost.randomElement()))
        tableView.estimatedRowHeight = 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(
            text: dataSource[indexPath.row].name ?? "defaultText",
            avatar: dataSource[indexPath.row].avatar ?? "image1",
            messageText: dataSource[indexPath.row].textOfPost ?? " ",
            imagePost: dataSource[indexPath.row].imageOfOfPost ?? " ",
            dateOfPost: dataSource[indexPath.row].datePost ?? "01.01.2021")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        vc.post = dataSource[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func createDefaultPost() {
        dataSource.append(Post.init(
            foto: imagesForPost.randomElement(),
            textInPost: textsForPost.randomElement(),
            nameOfPost: namesForPost.randomElement(),
            image: imagesForPost.randomElement(),
            dateOfPost: datesForPost.randomElement()))
    }
}


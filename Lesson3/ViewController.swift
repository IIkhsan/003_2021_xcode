//
//  ViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = [Post.init(author: User.init(username: "Alex23252", image: #imageLiteral(resourceName: "ava-vk-animal-91")), text: "Привет! Мы сделали для тебя новый сайт с лучшими квестами и мероприятиями Москвы: http://vk.cc/55kbzm Все квесты Москвы в одном месте, цены, бонусы, отзывы и контакты. А еще там есть видео и фотоотчеты с прошедших квестов! Переходи по ссылке и читай больше о наших квестах и скидках! Показать полностью... Хочешь получить от нас бесплатный купон на 5 квестов в подарок?", image: #imageLiteral(resourceName: "c13e60c5db62cea5b1f394883c7a90c7")),
                         .init(author: .init(username: "Bulat344635", image: #imageLiteral(resourceName: "1202399791_preview_15034743_1798112143788452_7709561090543190016_n")), text: "Привет всем! Вот и пришло время рассказать о своих впечатлениях от пользования этими чудо девайсами в течении месяца. Я уже писала свой отзыв об очках, но в него не вошла еще одна замечательная вещь, а именно - часы. Как-то у меня их не было ни разу и вот, в этом отзыве я расскажу почему. Но сначала немного истории. Первые наручные часы были изобретены в 1652 году, их изобрел англичанин Сэмюэль Харрисон. С этого времени часы стали пользоваться популярностью.", image: nil),
                         .init(author: .init(username: "Bulat344635", image: #imageLiteral(resourceName: "1202399791_preview_15034743_1798112143788452_7709561090543190016_n")), text: nil, image: #imageLiteral(resourceName: "ryan-lepage")),
                         .init(author: .init(username: "Poll12568", image: #imageLiteral(resourceName: "mult-ava-instagram-2")), text: nil, image: #imageLiteral(resourceName: "camera-1868773_1280")),
                         .init(author: .init(username: "Poll12568", image: #imageLiteral(resourceName: "mult-ava-instagram-2")), text: "Привет всем! Зашел сюда, так как по моей проблеме ответа в другом топе не нашел. Итак. После замены передних колодок на оригинальные тормоза стали тормозить хуже чем до замены, т.е. если раньше машина отлично останавливалась с любой скорости, то теперь с 80-100 км/ч только с притормаживанием (нажимаешь плавно на тормоз, а машина немного подтормаживает), при этом педаль тормоза стала немного проваливаться. Также очень неприятно стало тормозить со скорости после 80 км/ч.", image: #imageLiteral(resourceName: "201321061558118131"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func navigation() {
        
    }
}

extension ViewController: PostDetailViewControllerDelegate {
    func onDataChange(post: Post) {
        posts.append(post)
        tableView.reloadData()
    }
}

extension ViewController: PostTableViewCellDelegate {
    func didTapButton(post: Post, cell: UITableViewCell) {
        guard let cellIndexPath = tableView.indexPath(for: cell) else { return }
        posts.remove(at: cellIndexPath.row)
        posts.insert(post, at: cellIndexPath.row)
        tableView.reloadRows(at: [cellIndexPath], with: .bottom)
    }
}
  
// MARK: - Table view data source & delegate
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell:PostTableViewCell
        
        if post.image == nil {
             
            cell = tableView.dequeueReusableCell(withIdentifier: "PostTextTableViewCell", for: indexPath) as! PostTextTableViewCell
            
        }else if post.text == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: "PostImageTableViewCell", for: indexPath) as! PostImageTableViewCell
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "PostTextImageTableViewCell", for: indexPath) as! PostTextImageTableViewCell
        }
        cell.configure(post: post, delegate: self)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        let post = posts[indexPath.row]
        if post.image == nil {
            return 200
        }
        if post.text == nil {
            return 400
        }
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = posts[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PostDetailViewController") as! PostDetailViewController
        vc.post = post
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


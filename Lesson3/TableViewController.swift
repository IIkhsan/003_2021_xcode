//
//  TableViewController.swift
//  Lesson3
//
//  Created by Alina Bikkinina on 27.09.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var posts: [News] = [NewsWithImage.init(groupTitle: "Маги шутят", groupImg: UIImage.init(named: "gr5") ?? UIImage(), postTime: "вчера в 9:36", postText: "", hasImage: true, postImage: UIImage.init(named: "p5") ?? UIImage()),
                         NewsWithImage.init(groupTitle: "Как я встретил столбняк", groupImg: UIImage.init(named: "gr1") ?? UIImage(), postTime: "24 сентября в 8:15", postText: "", hasImage: true, postImage: UIImage.init(named: "p2") ?? UIImage()),
                         .init(groupTitle: "ITIS mentor", groupImg: UIImage.init(named: "gr2") ?? UIImage(), postTime: "20 сен в 19:10", postText: "Привет! На связи команда наставничества 😉 \n3… 2… 1…\nОбъявляем набор через формы закрытым и… \nПриглашаем всех на занятия!!! \nКак попасть на занятия?\n- Найти свою академическую группу в таблице\n- Присоединиться к беседам ВК и к командам MS Teams (ссылка и код напротив ваших предметов)\n * если на месте времени стоит прочерк, то оно обговаривается с тьютором\n\nТаблица со ссылками: https://docs.google.com/spreadsheets/d/11M5uvs27ozMwP..\n\nОбозначения групп: первый символ — буква предмета, второй — номер тьюторской группы\n\n1 курс:\nD - Дискретная математика\nA - Алгебра и геометрия\nM - Математический анализ\nI - Информатика\n\n2 курс:\nI - Информатика\nN - Сети и потоки\nB - Базы данных\nP - Теория вероятностей\n\n=================================================\n\nВашей группы нет в таблице?\nИз вашей группы никто не записался на тьюторства. Если всё же хотите ходить, скоро мы запустим Telegram-бота для записи на занятия👌", hasImage: false),
                         NewsWithImage.init(groupTitle: "Как я встретил столбняк", groupImg: UIImage.init(named: "gr1") ?? UIImage(), postTime: "24 сентября в 9:15", postText: "", hasImage: true, postImage: UIImage.init(named: "p3") ?? UIImage()),
                         NewsWithImage.init(groupTitle: "Темная сторона", groupImg: UIImage.init(named: "gr3") ?? UIImage(), postTime: "24 сентября в 9:23", postText: "", hasImage: true, postImage: UIImage.init(named: "p4") ?? UIImage()),
                         .init(groupTitle: "Рассказано", groupImg: UIImage.init(named: "gr4") ?? UIImage(), postTime: "вчера в 23:20", postText: "У меня с партнером не большая фирма, цветочная, возим цветы из Голландии и Венгрии, в основном. Короче, кто не в курсе, есть такой трюк: покупаются белые никому ненужные гвоздики, очень дешево. Ну и на фирме, используя пищевую краску (ее можно есть) и горячую воду, цветы ставятся в бочку и за пару часов через стебель всасывают краску, и становятся любого цвета, который только пожелаешь.\n\nБыл заказ на свадьбу, голубые гвоздики. Мы не успевали, решили что в машине дойдут, благо не долго. Короче, привезли в церковь еще белыми и заказчику объясняем, что \"ля буду, через пол часа дойдет краска и к венчанию все будет в ажуре,будут голубыми\".\n\nНа следующий день заказчик звонит и ржет как лошадь.Священник орал на всю церковь: \"Смотрите Чудо,Чудо в церкви, белые цветы превратились в голубые\".\n\nВот так и становишься очевидцем Чуда.", hasImage: false)
                         ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Новости"
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ImageCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsWithImageTableViewCell")
        let nib1 = UINib(nibName: "TextCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "TextNewsTableViewCell")
        
//        self.tableView.register(TestTableViewCell.self, forCellReuseIdentifier: "TestTableViewCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentPost = posts[indexPath.row]

        if currentPost.hasImage {
            guard let imageCell = tableView.dequeueReusableCell(withIdentifier: "NewsWithImageTableViewCell", for: indexPath) as? NewsWithImageTableViewCell else {
                return UITableViewCell()
            }
            imageCell.setData(postInfo: currentPost as! NewsWithImage)
            return imageCell
        }
        
        guard let textCell = tableView.dequeueReusableCell(withIdentifier: "TextNewsTableViewCell", for: indexPath) as? TextNewsTableViewCell else {
            return UITableViewCell()
        }
        textCell.setData(postInfo: currentPost)
        return textCell
        }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            posts[indexPath.row].hasImage ? 574 : 250
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let currentPost = posts[indexPath.row]

        if currentPost.hasImage {
            let imageScreenStoryboard = UIStoryboard(name: "ImageScreen",bundle: nil)
            
            guard let imagePostViewController = imageScreenStoryboard.instantiateViewController(withIdentifier: "ImagePostViewController") as? ImagePostViewController else { return }
            imagePostViewController.post = posts[indexPath.row] as! NewsWithImage
            navigationController?.pushViewController(imagePostViewController, animated: true)
        } else {
            let textScreenStoryboard = UIStoryboard(name: "TextScreen",bundle: nil)
            guard let textPostViewController = textScreenStoryboard.instantiateViewController(withIdentifier: "TextPostViewController") as? TextPostViewController else { return }
            textPostViewController.post = posts[indexPath.row]
            navigationController?.pushViewController(textPostViewController, animated: true)
        }
    }
}

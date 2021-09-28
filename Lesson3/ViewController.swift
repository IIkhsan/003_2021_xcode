//
//  ViewController.swift
//  Lesson3
//
//  Created by Алексей Горбунов on 27.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var postsTableView: UITableView!
    
    var posts: [Post] =
    [
        Post(postImage: nil, postText: "С эстетической точки зрения синтвейв погружает слушателя в ретрофутуристический мир, воссоздавая дух научной фантастики, боевиков, фильмов ужасов и футуристических гоночных игр 1980-х. Особенно близок он с киберпанком. Синтвейв выражает ностальгию по культуре 1980-х, пытается уловить атмосферу тех лет и погрузить в неё. Видеоклипы и обложки альбомов в этом жанре часто делают в стилистике пиксель-арта, аниме или старых фантастических фильмов. Символика состоит из: полосатого солнца, сеточной перспективы гор/плоскости, автомобилей 1980-х, двумерных пальм, и двумерного мегаполиса в аналогичной триаде розового цвета."),
        Post(postImage: UIImage(named: "synth9") ?? UIImage(), postText: "С музыкальной точки зрения синтвейв вдохновлён нью-вейвом, а также саундтреками многих фильмов, видеоигр и телевизионных шоу 1980-х годов. В качестве источника вдохновения упоминают таких композиторов, как Джон Карпентер и Вангелис, группу Tangerine Dream. Этот стиль преимущественно инструментальный и использует в звучании характерные элементы электронной музыки 1980-х, электронные барабаны, «gated reverb (англ.)русск.», мелодии и бас-партии, сыгранные на аналоговых синтезаторах. Некоторые исполнители добавляют к этому соло-партии на электрогитарах. Всё делается для достижения сходства с электронной музыкой тех лет."),
        Post(postImage: UIImage(named: "synth2") ?? UIImage(), postText: nil),
        Post(postImage: UIImage(named: "synth3") ?? UIImage(), postText: nil),
        Post(postImage: nil, postText: "Perturbator (с англ. — «Возмутитель спокойствия») — синтвейв-проект французского музыканта Джеймса Кента (англ. James Kent). Альтер-эго Кента описывается как «Наполовину человек, наполовину синтезатор» (англ. The Legend Says He's Half Human, Half Synthesizer). Мировую известность приобрёл после выхода игры Hotline Miami, в создании саундтрека к которой принял участие. Для музыки Perturbator характерна мрачная атмосфера и жёсткий, по сравнению с иной ретро-музыкой, ритм, что роднит данный проект с метал-группами. Вдохновение для этого проекта Кент черпает из фильмов Джона Карпентера, киберпанка (Akira, «Призрак в доспехах», «Бегущий человек» и т. д.) и культуры VHS B-movie."),
        Post(postImage: UIImage(named: "synth4") ?? UIImage(), postText: "Carpenter Brut — синтвейв-проект французского музыканта Фрэнка Уэзо (англ. Franck Hueso). Мировую известность приобрёл после выхода игры Hotline Miami 2, в создании саундтрека к которой принял участие. Для музыки Carpenter Brut характерно сильное влияние метала, жесткий и быстрый ритм песен."),
        Post(postImage: UIImage(named: "synth5") ?? UIImage(), postText: nil),
        Post(postImage: UIImage(named: "synth6") ?? UIImage(), postText: "Венсан Пьер Клод Белорже (фр. Vincent Pierre Claude Belorgey, род. 31 июля 1975, Сен-Сен-Дени) — диджей, представитель французской хаус-музыки, более известен под именем Kavinsky. Вдохновением для творчества Венсана служат фильмы о зомби эпохи VHS, хип-хоп и фанк последних десятилетий XX века. Исполняет треки в стиле электронных саундтреков к фильмам 1980-х годов. Музыкальные композиции и видеоклипы Белорже повествуют о вымышленном персонаже Kavinsky — молодом человеке, который погиб в 1986 году, не справившись с управлением своего красного Ferrari Testarossa, и восстал из мёртвых 20 лет спустя, для того чтобы творить собственную электронную музыку."),
        Post(postImage: UIImage(named: "synth7") ?? UIImage(), postText: nil),
        Post(postImage: UIImage(named: "synth8") ?? UIImage(), postText: nil),
        Post(postImage: nil, postText: "Популярности синтвейва в 2010-е поспособствовало его использование в саундтреках кино и игр, в особенности в триллере «Драйв» Николаса Виндинга Рефна и игре Hotline Miami. В 2019 году вышел документальный фильм «Эпоха синтвейва», содержащий интервью со множеством известных представителей жанра."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postsTableView.dataSource = self
        postsTableView.delegate = self
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 270
        }
            
        let post = posts[indexPath.row - 1]
        
        if post.postImage == nil {
            return 190
        } else if post.postText == nil {
            return 400
        }
        return 520
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.row != 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController
            secondViewController?.post = posts[indexPath.row - 1]
            navigationController?.pushViewController(secondViewController!, animated: true)
        }
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
            
            return profileCell
        }
        
        let index = indexPath.row - 1
        let post = posts[index]
        
        if post.postImage == nil {
            guard let postCell = tableView.dequeueReusableCell(withIdentifier: "PostTextTableViewCell", for: indexPath) as? PostTextTableViewCell else { return UITableViewCell() }
            
            postCell.setData(post: posts[index])
            return postCell
        }
        
        if post.postText == nil {
            guard let postCell = tableView.dequeueReusableCell(withIdentifier: "PostImageTableViewCell", for: indexPath) as? PostImageTableViewCell else { return UITableViewCell() }
            
            postCell.setData(post: posts[index])
            return postCell
        }
        
        guard let postCell = tableView.dequeueReusableCell(withIdentifier: "PostImageTextTableViewCell", for: indexPath) as? PostImageTextTableViewCell else { return UITableViewCell() }
        
        postCell.setData(post: posts[index])
        return postCell
    }
}

struct Post {
    
    let postImage: UIImage?
    let postText: String?
}

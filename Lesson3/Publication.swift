//
//  Student.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import Foundation
import UIKit

struct Publication {
    let username: String
    let profileImage: UIImage?
    let mainImage: UIImage?
    let mainText: String?
}
var publications = [Publication(username: "Kotik", profileImage: UIImage.init(named: "avatar1"), mainImage: nil, mainText:"Если бы стал миллионером, то нераздумывая купил бы небольшой дом с бассейном в Беверли Хиллс, это то самое место, где Лос Анджелес ровно такой, каким его себе представляешь: чистый, пальмы, идеальные газончики"),
                    Publication(username: "Kro$$$hh", profileImage: UIImage.init(named: "avatar2"), mainImage: UIImage.init(named: "main1"), mainText: nil),
                    Publication(username: "losyk12321", profileImage: UIImage.init(named: "avatar3"), mainImage: UIImage.init(named: "main3"), mainText: "Смеша́рики — российский мультипликационный сериал, ориентированный на широкую аудиторию. Создан в рамках образовательного проекта «Мир без насилия» и производится при поддержке Министерства культуры Российской Федерации."),
                    Publication(username: "IamGeorgeRussel", profileImage: UIImage.init(named: "avatar4"), mainImage: UIImage.init(named: "main4"), mainText: "«Уи́льямс» — британская команда «Формулы-1». Девятикратный обладатель Кубка конструкторов «Формулы-1». Команда была основана Фрэнком Уильямсом и Патриком Хэдом в 1977 году, после предыдущего проекта Уильямса — Frank Williams Racing Cars, окончившегося неудачно."),
                    Publication(username: "Starege228", profileImage: UIImage.init(named: "avatar6"), mainImage: nil, mainText: "Pepe the Frog, one of the most popular internet memes of all time. It's now considered a symbol of hate, according to the Anti-Defamation League. But it wasn't always like this. The cartoon frog that currently sits beside the swastika and the Iron Cross was born here, a nonpolitical comic about four roommates who enjoy being lazy and playing video games. Pepe the Frog first appeared in 2005 in the comic Boy's Life by artist and illustrator Matt Furie. The comics depict Pepe and his anthropomorphized animal friends behaving like stereotypical post-college bros: playing video games, eating pizza, smoking pot and being harmlessly gross."),
                    Publication(username: "PsychoMonster123123", profileImage: UIImage.init(named: "avatar7"), mainImage: UIImage.init(named: "main6"), mainText: nil),
                    Publication(username: "Kro$$$hh", profileImage: UIImage.init(named: "avatar1"), mainImage: UIImage.init(named: "main5"), mainText: nil),
                    Publication(username: "IamGeorgeRussel", profileImage: UIImage.init(named: "avatar4"), mainImage: nil, mainText: "P10 today and points in four of the last five races. It may not seem like the result we wanted from P3 on the grid, but we've come so far this season we can be proud of that stat. 👊"),
                    Publication(username: "Starege228", profileImage: UIImage.init(named: "avatar6"), mainImage: UIImage.init(named: "main8") , mainText: "Совсем не пошла сегодня игра у NAVI R6 😐"),Publication(username: "asdhasbj23", profileImage: UIImage.init(named: "EzhAvatar") , mainImage: UIImage.init(named: "main7"), mainText: "Вы, конечно, опять меня извините, но я вас ещё раз спрошу, что, некомпетентны? Вы действительно думаете, что этот уровень сервиса может быть удовлетворительным? Ваша коллега, простите, проводит какие-то манипуляции с предоставленными ей картами. Другой ваш коллега делает что-то похожее... – Пожалуйста, приглядитесь внимательнее... – Вы, конечно, меня извините, но по-моему для данных функций у вас есть дилер, чтобы делать это в открытую, на глазах посетителей. – Ваша просьба и некоторое возмущение, быть может, оправданы в данной ситуации. Теперь этим действительно будет заниматься дилер. Просто в силу определённых обстоятельств, полномочия были делегированы мне...")]

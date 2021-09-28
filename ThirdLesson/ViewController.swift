//
//  ViewController.swift
//  ThirdLesson
//
//  Created by Renat Murtazin on 28.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts = [PostStruct(postImage: UIImage(named: "Carti1"), postText: nil, profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"), PostStruct(postImage: UIImage(named: "Carti2"), postText: "Cras rutrum tellus nec tortor malesuada feugiat. Mauris auctor turpis at finibus bibendum. Donec id hendrerit eros, in ornare dolor. In felis libero, elementum vel viverra vitae, efficitur eget eros. Nam tellus enim, semper sed tellus vel, pharetra varius felis. Aenean libero sem, vestibulum sit amet gravida eget, ornare non justo. Fusce interdum mi bibendum, rutrum sapien vel, ornare sapien. Aliquam in nisi ante. Pellentesque a ante at ex porta iaculis. Suspendisse pretium sapien ut dolor iaculis, vitae sollicitudin leo viverra. Integer tristique ultrices felis ac pharetra. Fusce eget ante nulla. Ut vel pellentesque sapien, ac pulvinar tortor.", profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"),PostStruct(postImage: nil, postText: "Nam iaculis accumsan ultricies. Vestibulum libero erat, venenatis eu lobortis quis, consequat sit amet lectus. Praesent a tincidunt sem, a sagittis leo. Ut eleifend dui quis massa vehicula molestie. Etiam vel aliquam augue. Nunc pulvinar leo odio, vitae malesuada diam placerat eu. Vivamus sagittis tincidunt risus. Nunc ornare odio ac lorem bibendum rhoncus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget metus commodo augue efficitur dignissim vel in nunc. Duis eget ornare tortor. Donec faucibus enim ut aliquam lobortis. Fusce egestas nisi metus, nec aliquet massa pulvinar sed. Proin rhoncus laoreet viverra. Praesent rhoncus nulla eget lacus ultrices, quis gravida ex vestibulum.", profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"),PostStruct(postImage: UIImage(named: "Kendall1"), postText: "Duis placerat magna eu velit hendrerit, et laoreet sapien ultrices. Donec mattis bibendum diam non lacinia. Cras pharetra iaculis metus non ultrices. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur gravida tortor rhoncus lectus sodales sollicitudin. Sed lectus nunc, pellentesque quis lectus et, vehicula consequat nibh. Maecenas a convallis neque. Integer eget lobortis metus. Proin sed nibh sapien. Proin malesuada, metus nec ullamcorper lobortis, lectus est bibendum nulla, sit amet suscipit quam ipsum in leo. Quisque pellentesque neque vehicula dui lobortis mattis. Nam feugiat metus ut fermentum placerat. Nullam nec lobortis tellus. Nulla ultrices a purus et egestas.r", profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"),PostStruct(postImage: UIImage(named: "Kendall2"), postText: "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer tempus odio a magna cursus convallis et quis nisi. Donec pellentesque nisl sit amet vulputate euismod. Suspendisse elementum diam ac euismod sollicitudin. Fusce nec risus quis ipsum tincidunt iaculis a non nibh. Duis lorem dui, tincidunt et bibendum sed, ullamcorper quis felis. Sed sit amet dui congue, consequat neque sed, dignissim nisl. Integer efficitur, eros sed pharetra pulvinar, enim mauris laoreet ex, at placerat leo lectus vitae tortor. Aliquam lectus nulla, fringilla in sodales id, malesuada eu arcu. Maecenas porttitor enim eget metus rutrum sodales. Phasellus finibus ullamcorper massa, nec elementum urna vestibulum eu. In vulputate dui in nibh dapibus, non vehicula tortor accumsan.", profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"),PostStruct(postImage: nil, postText: "Mauris posuere lorem erat, eu tincidunt lacus pulvinar eget. Cras quis lacinia mauris. Donec consectetur varius neque, vel feugiat purus mollis a. Aliquam at augue vitae eros rutrum consequat. Proin tempus mauris nec sem molestie tempus. Donec euismod consectetur lacus ac bibendum. Maecenas egestas efficitur tristique", profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"),PostStruct(postImage: UIImage(named: "Travis2"), postText: nil, profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"),PostStruct(postImage: UIImage(named: "Travis3"), postText: "Integer eu accumsan ligula, in dignissim ante. Cras in blandit enim, eu consequat mauris. Donec dictum sodales risus, nec suscipit elit pretium nec. Integer semper tortor nibh, id ornare sapien euismod a. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi malesuada ante id augue interdum, eleifend tincidunt odio egestas. Praesent vehicula arcu dapibus mauris accumsan, et rhoncus arcu viverra. Proin augue lacus, varius in dolor ut, imperdiet lobortis eros. Proin ac lacus feugiat, euismod urna sed, ornare lectus. Suspendisse eget tempor sem. Ut eleifend orci vitae rutrum auctor. Sed consectetur arcu at pharetra sollicitudin.", profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"),PostStruct(postImage: UIImage(named: "Travis4"), postText: "Praesent orci dolor, venenatis ac ornare ac, luctus sit amet nulla. Aliquam commodo est nec purus posuere, vel euismod arcu efficitur. Sed vel pulvinar turpis. Praesent sit amet augue sit amet ligula rutrum aliquam vitae ut dolor. Nulla facilisi. Integer mauris erat, ultricies a egestas in, efficitur eu diam. Quisque semper eget neque a tempus. Quisque venenatis dignissim lorem, quis hendrerit ipsum ullamcorper eu. Integer id sapien vehicula, interdum libero in, dignissim magna. Maecenas et metus placerat, aliquet enim nec, aliquet dolor. Nullam augue velit, convallis mollis varius sit amet, molestie quis mauris. Praesent at molestie sem. Aliquam pulvinar, quam sed tempus ultrices, ligula justo luctus turpis, et tincidunt est tellus in ex. Suspendisse sollicitudin mi ultrices porta blandit. Mauris lectus arcu, tempor nec enim nec, cursus fringilla nibh. Aliquam porttitor id turpis a rutrum.", profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер"),PostStruct(postImage: UIImage(named: "Travis5"), postText: "Etiam varius purus nec risus condimentum, id tincidunt est porta. Pellentesque nec sodales sem, a ornare turpis. Pellentesque elementum pharetra ligula. Duis malesuada finibus magna, non gravida lectus consequat quis. In diam sem, bibendum ut magna sollicitudin, sodales dignissim urna. Aenean dictum, sapien ac consequat pharetra, eros urna ornare mauris, in laoreet sapien magna nec est. In aliquet nibh sollicitudin ante sollicitudin, nec aliquet eros pharetra. Nam arcu nibh, lobortis in risus fermentum, elementum elementum nisi. Aenean at arcu feugiat, iaculis est quis, eleifend elit. Phasellus vel viverra elit, at venenatis ligula. Suspendisse non enim libero. Donec quis blandit est. Cras nisi metus, molestie at dui sit amet, malesuada scelerisque sapien. Vivamus cursus tristique vehicula.", profileImage: UIImage(named: "Kizaru1"), profileLabel: "Шиммер Шиммер")]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ImageOnlyPostTableViewCell", bundle: nil), forCellReuseIdentifier: "imageOnlyPostCellIdentifier")
        tableView.register(UINib(nibName: "TextOnlyPostTableViewCell", bundle: nil), forCellReuseIdentifier: "textOnlyPostCellIdentifier")
        tableView.register(UINib(nibName: "FullPostTableViewCell", bundle: nil), forCellReuseIdentifier: "fullPostCellIdentifier")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = posts[indexPath.row]
        
//        let randomPost = Int.random(in: 1...15)
//
//        switch randomPost {
//        case 1...5:
        if (model.postText == nil) {
            let postName = "imageOnlyPostCellIdentifier"
            let cell = tableView.dequeueReusableCell(withIdentifier: postName, for: indexPath) as! ImageOnlyPostTableViewCell
            cell.imageOnlyPostConfigure(model)
            return cell
        }
//        case 6...10:
        if (model.postImage == nil) {
            let postName = "textOnlyPostCellIdentifier"
            let cell = tableView.dequeueReusableCell(withIdentifier: postName, for: indexPath) as! TextOnlyPostTableViewCell
            cell.textOnlyPostConfigure(model)
            return cell
        }
//        case 11...15:
            if (model.postImage != nil) && (model.postText != nil) {
            let postName = "fullPostCellIdentifier"
            let cell = tableView.dequeueReusableCell(withIdentifier: postName, for: indexPath) as! FullPostTableViewCell
            cell.fullPostConfigure(model)
            return cell
//        default:
//            break
//        }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

//        switch UITableViewCell() {
//
//        case is ImageOnlyPostTableViewCell:
//            return 400
//        case is TextOnlyPostTableViewCell:
//            return 180
//        case is FullPostTableViewCell:
//            return 500
//        default:
//            break
//        }
        return 510
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let model = posts[indexPath.row]
        
        if (model.postText == nil) {
            let segueIdentifier = "detailControllerIdentifier"
            performSegue(withIdentifier: segueIdentifier, sender: model)
        }
        else if (model.postImage == nil) {
            let segueIdentifier = "secondDetailControllerIdentifier"
            performSegue(withIdentifier: segueIdentifier, sender: model)
        }
        else if (model.postText != nil) && (model.postImage != nil) {
            let segueIdentifier = "thirdDetailControllerIdentifier"
            performSegue(withIdentifier: segueIdentifier, sender: model)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailControllerIdentifier",
            let destinationController = segue.destination as? DetailViewController,
            let post = sender as? PostStruct {
            destinationController.post = post
        }
        if segue.identifier == "secondDetailControllerIdentifier",
            let destinationController = segue.destination as? SecondDetailViewController,
            let post = sender as? PostStruct {
            destinationController.post = post
        }
        if segue.identifier == "thirdDetailControllerIdentifier",
            let destinationController = segue.destination as? ThirdDetailViewController,
            let post = sender as? PostStruct {
            destinationController.post = post
        }
    }
    
}


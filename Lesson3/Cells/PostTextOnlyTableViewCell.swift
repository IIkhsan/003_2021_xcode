import UIKit

class PostTextOnlyTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func makePostOnlyText(post: Post) {
        profileImage.image = post.profileImage
        profileNameLabel.text = post.profileLabel
        infoLabel.text = post.info
        infoLabel.sizeToFit()
    }
    
}

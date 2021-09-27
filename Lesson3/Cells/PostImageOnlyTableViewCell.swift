import UIKit

class PostImageOnlyTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func makePostOnlyImage(post: Post) {
        profileImage.image = post.profileImage
        profileNameLabel.text = post.profileLabel
        contentImage.image = post.contentImage
    }
    
}

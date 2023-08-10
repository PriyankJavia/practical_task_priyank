

import UIKit

class UserDataTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

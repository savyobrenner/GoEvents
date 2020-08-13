import UIKit
import Kingfisher

class TicketCell: UITableViewCell {
    
    @IBOutlet weak var ivEvent: UIImageView!
    @IBOutlet weak var lbEventName: UILabel!
    @IBOutlet weak var lbEventDate: UILabel!
    @IBOutlet weak var lbTicketsQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configImage(with url: String){
        let url = URL(string: url)
        ivEvent.kf.indicatorType = .activity
        ivEvent.kf.setImage(with: url)
    }
    
    

}

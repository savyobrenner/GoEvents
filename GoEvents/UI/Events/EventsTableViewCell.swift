import UIKit
import Kingfisher

class EventsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivEvent: UIImageView!
    @IBOutlet weak var lbEventName: UILabel!
    @IBOutlet weak var lbEventDate: UILabel!
    @IBOutlet weak var lbTicketPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func prepare(with event: Events){
        let url = URL(string: event.image)
        lbEventName.text = event.eventName
        lbEventDate.text = event.date
        lbTicketPrice.text = "R$\(event.price)"
        ivEvent.kf.indicatorType = .activity
        ivEvent.kf.setImage(with: url)
    }

}

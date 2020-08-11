import UIKit

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
        ivEvent.image = nil
        lbEventName.text = event.eventName
        lbEventDate.text = event.date
        lbTicketPrice.text = "R$\(event.price)"
    }

}

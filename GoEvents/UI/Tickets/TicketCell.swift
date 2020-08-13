import UIKit

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
    
    func prepare(with event: Events){
        let quantity = Int(event.finalPrice!)! / event.price
        let url = URL(string: event.image)
        lbEventName.text = event.eventName
        lbEventDate.text = event.date
        lbTicketsQuantity.text = "\(quantity) ingresso(s)."
        ivEvent.kf.indicatorType = .activity
        ivEvent.kf.setImage(with: url)
    }
    
    

}

import UIKit
import Kingfisher

class EventsDetailsViewController: UIViewController {
    
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbEventName: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var lbProducerName: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    
    var image: String?
    var eventName: String?
    var date: String?
    var location: String?
    var producerName: String?
    var price: Int?
    var eventDescription: String?
    var startTime: String?
    var endTime: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareMainScreen()
    }
    
    @IBAction func buyTicket(_ sender: Any) {
        
    }
    
    func prepareMainScreen(){
        
        let dateFormatted = "\(date!) das \(startTime!)h as \(endTime!)h"
        
        ivImage.kf.indicatorType = .activity
        ivImage.kf.setImage(with: URL(string: image!))
        lbEventName.text = eventName!
        lbDate.text = dateFormatted
        lbLocation.text = location!
        lbProducerName.text = producerName!
        lbPrice.text = "R$\(price!)"
        tvDescription.text = eventDescription!
        
    }
    
}

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
    
    var event: Events!


    override func viewDidLoad() {
        super.viewDidLoad()
        prepareMainScreen()
    }
    
    @IBAction func buyTicket(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ticketsNumber"{
            let vc = segue.destination as! TicketsNumberViewController
            vc.event = event
        }
    }
    
    
    func prepareMainScreen(){
        let dateFormatted = "\(event.date) das \(event.startTime)h as \(event.endTime)h"
        
        ivImage.kf.indicatorType = .activity
        ivImage.kf.setImage(with:URL(string: event.image))
        lbEventName.text = event.eventName
        lbDate.text = dateFormatted
        lbLocation.text = event.location
        lbProducerName.text = event.producer
        lbPrice.text = "R$\(event.price)"
        tvDescription.text = event.eventDescription
        
    }
    
}

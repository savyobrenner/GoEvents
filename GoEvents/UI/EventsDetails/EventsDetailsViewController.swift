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
    @IBOutlet weak var btBuy: UIButton!
    
    var event: Events!

    let injection = Injection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareMainScreen()
        checkUser()
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
    
    func checkUser(){
        injection.authenticationServices.isAlreadyLogged(onSuccess: {
            self.btBuy.isUserInteractionEnabled = true
            self.btBuy.backgroundColor = #colorLiteral(red: 0, green: 0.5356216431, blue: 0.7853057384, alpha: 1)
            self.btBuy.setTitle("Comprar Ingresso", for: .normal)
        }) {
            self.btBuy.isUserInteractionEnabled = false
            self.btBuy.backgroundColor = .gray
            self.btBuy.setTitle("Logue para continuar com a compra", for: .normal)
        }
    }
    
}

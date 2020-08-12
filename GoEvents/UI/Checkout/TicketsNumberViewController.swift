import UIKit

class TicketsNumberViewController: UIViewController {
    
    
    @IBOutlet weak var tfTicketsNumber: UITextField!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var btGoToCardCheckout: UIButton!
    @IBOutlet weak var btMinus: UIButton!
    @IBOutlet weak var btPlus: UIButton!
    
    
    
    var event: Events!
    var quantity = 0
    var totalPrice: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validations()
    }
    
    
    @IBAction func minusTicket(_ sender: UIButton) {
        quantity -= 1
        validations()
    }
    
    @IBAction func plusTicket(_ sender: Any) {
         quantity += 1
        validations()
    }
    
    @IBAction func goToCardCheckout(_ sender: Any) {
    }
    
    func validations(){
        if quantity == 0 {
            btGoToCardCheckout.isUserInteractionEnabled = false
            btGoToCardCheckout.backgroundColor = .gray
            btMinus.isUserInteractionEnabled = false
            btMinus.tintColor = .gray
        } else {
            btGoToCardCheckout.isUserInteractionEnabled = true
            btGoToCardCheckout.backgroundColor = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.737254902, alpha: 1)
            btMinus.isUserInteractionEnabled = true
            btMinus.tintColor = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.737254902, alpha: 1)
        }
        totalPrice = Double(event.price * quantity)
        let displayPrice = String(format: "%.2f", totalPrice)
        tfTicketsNumber.text = "\(quantity)"
        finalPrice.text = "Valor total: R$ " + displayPrice
    }
    
    
    
}

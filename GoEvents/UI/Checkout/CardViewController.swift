import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var ivCard: UIImageView!
    @IBOutlet weak var tfCardNumber: UITextField!
    @IBOutlet weak var tfCardHolderName: UITextField!
    @IBOutlet weak var tfMonth: UITextField!
    @IBOutlet weak var tfYear: UITextField!
    @IBOutlet weak var tfCVV: UITextField!
    @IBOutlet weak var btBuy: UIButton!
    @IBOutlet weak var lbFinalPrice: UILabel!
    
    
    var event: Events!
    var finalPrice: String!

    let injection = Injection()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTfDelegate()
        lbFinalPrice.text = finalPrice
    }
    
    
    @IBAction func buy(_ sender: Any) {
        
    }
    
    func setTfDelegate(){
        tfMonth.delegate = self
        tfYear.delegate = self
        tfCVV.delegate = self
        tfCardNumber.delegate = self
    }
    

}

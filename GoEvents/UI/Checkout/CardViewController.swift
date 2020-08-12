import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var ivCard: UIImageView!
    @IBOutlet weak var tfCardNumber: UITextField!
    @IBOutlet weak var tfCardHolderName: UITextField!
    @IBOutlet weak var tfMonth: UITextField!
    @IBOutlet weak var tfYear: UITextField!
    @IBOutlet weak var tfCVV: UITextField!
    @IBOutlet weak var btBuy: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tfMonth.delegate = self
        tfYear.delegate = self
        tfCVV.delegate = self
        tfCardNumber.delegate = self
    }
    
    
    @IBAction func buy(_ sender: Any) {
        
    }
    

}

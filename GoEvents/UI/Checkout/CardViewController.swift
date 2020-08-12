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
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    
    var event: Events!
    let injection = Injection()
    var name: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        loading.isHidden = true
        setTfDelegate()
        lbFinalPrice.text = "R$ " + event.finalPrice!
        injection.database.getName(uid: injection.authenticationServices.currentUserUid()) { (name) in
            self.name = name
        }
    }
    
    
    @IBAction func buy(_ sender: Any) {
        loading.startAnimating()
        loading.isHidden = false
        btBuy.isHidden = true
        validateIfFormsIsEmpty()
    }
    
    func setTfDelegate(){
        tfMonth.delegate = self
        tfYear.delegate = self
        tfCVV.delegate = self
        tfCardNumber.delegate = self
    }
    

}

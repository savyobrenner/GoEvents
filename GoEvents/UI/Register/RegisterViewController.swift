import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassowrd: UITextField!
    @IBOutlet weak var swAge: UISwitch!
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    
    let injection = Injection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loading.isHidden = true


    }
    
    @IBAction func register(_ sender: Any) {
        validateForms()
        
    }
        
    
}

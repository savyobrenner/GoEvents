import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    
    let injection = Injection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loading.isHidden = true
        
    }
    
    @IBAction func login(_ sender: Any) {
        validateForms()
    }
    
    @IBAction func recoveryPassword(_ sender: Any) {
        validateFormsForRecoveryPassword()
    }
    
    
}

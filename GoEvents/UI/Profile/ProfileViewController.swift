import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbTicketsNumber: UILabel!
    @IBOutlet weak var tfUserEmail: UITextField!
    @IBOutlet weak var btLogOut: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    let injection = Injection()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logOut(_ sender: Any) {
        injection.authenticationServices.logoutUser(onSuccess: {
            print("deslogou")
        }) {
            print("deu erro")
        }
    }
    
    func getPersonalInfos(){
        let uid = injection.authenticationServices.auth.currentUser?.uid
        lbUserName.text = injection.database.getName(uid: uid!)
        tfUserEmail.text = injection.database.getEmail(uid: uid!)
    }
    

    
}

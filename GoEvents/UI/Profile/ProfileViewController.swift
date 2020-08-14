import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbTicketsNumber: UILabel!
    @IBOutlet weak var tfUserEmail: UITextField!
    @IBOutlet weak var btLogOut: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var loggedView: UIView!
    
    
    let injection = Injection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        injection.authenticationServices.isAlreadyLogged(onSuccess: {
            self.loggedView.isHidden = false
            self.getPersonalInfos()
        }) {
            self.loggedView.isHidden = true
        }
    }
    
    @IBAction func loginWithGoogle(_ sender: Any) {
        
        injection.alerts.showAlert(titulo: "Em breve", mensagem: "Em breve será possível realizar o login com o Google.", on: self)
        
    }
    
    @IBAction func loginWithFacebook(_ sender: Any) {
        
        injection.alerts.showAlert(titulo: "Em breve", mensagem: "Em breve será possível realizar o login com o Facebook.", on: self)
        
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        loading.isHidden = false
        loading.startAnimating()
        btLogOut.isHidden = true
        
        injection.authenticationServices.logoutUser(onSuccess: {
            self.injection.alerts.showAlertWithCompletion(titulo: "Você saiu", mensagem: "Você deslogou da sua conta com sucesso!", on: self) {
                self.stopLoading()
            }
        }) {
            self.injection.alerts.showAlertWithCompletion(titulo: "Erro ao sair", mensagem: "Não foi possivel desconectar da sua conta, tente novamente!", on: self) {
                self.stopLoading()
            }
        }
    }
    
    func getPersonalInfos(){
        let uid = injection.authenticationServices.auth.currentUser?.uid
        injection.database.getName(uid: uid!, onSuccess: { (name) in
            self.lbUserName.text = name
        })
        injection.database.getEmail(uid: uid!) { (email) in
            self.tfUserEmail.text = email
        }
        injection.database.getNumberOfTicker(uid: uid!) { (number) in
            self.lbTicketsNumber.text = String(number)
        }
    }
    
    func stopLoading(){
        loading.isHidden = true
        loading.stopAnimating()
        btLogOut.isHidden = false
    }
    
    
    
}

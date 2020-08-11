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
        
    }
    
    func validateForms(){
        let emailIsEmpty = tfEmail.text?.isEmpty ?? true
        let passwordIsEmpty = tfPassword.text?.isEmpty ?? true
        
        self.loading.startAnimating()
        self.loading.isHidden = false
        self.btLogin.isHidden = true
        
        if(emailIsEmpty) {
            injection.alerts.showAlert(titulo: "Dado Inválido", mensagem: "O campo email está vazio", on: self)
            self.stopLoading()
        } else if (passwordIsEmpty) {
            injection.alerts.showAlert(titulo: "Dado Inválido", mensagem: "O campo senha está vazio", on: self)
            self.stopLoading()
        } else if (tfPassword.text!.count < 6){
            injection.alerts.showAlert(titulo: "Dado inválido", mensagem: "A senha deve conter pelo menos 6 caracteres.", on: self)
            self.stopLoading()
        } else {
            self.performUserLogin()
        }
    }
    
    func performUserLogin(){
        let email = tfEmail.text!
        let password = tfPassword.text!
        
        self.injection.authenticationServices.login(email: email, password: password, onSuccess: {
            
            if self.injection.authenticationServices.auth.currentUser!.isEmailVerified {
                print("passou")
                self.stopLoading()
            } else {
                self.injection.alerts.showAlert(titulo: "Email não verificado", mensagem: "Para acessar sua conta, favor ativar sua conta de email.", on: self)
                self.stopLoading()
            }
            
        }) { (error) in
            if error == .emailNotRegistred {
                self.injection.alerts.showAlert(titulo: "Email incorreto", mensagem: "Endereço de email informado não se encontra em nosso banco de dados.", on: self)
            } else if error == .FIRAuthErrorCodeWrongPassword {
                self.injection.alerts.showAlert(titulo: "Senha incorreta", mensagem: "Verifique sua senha e tente novamente.", on: self)
            } else if error == .FIRAuthErrorCodeInvalidEmail {
                self.injection.alerts.showAlert(titulo: "Email incorreto", mensagem: "Endereço de email incorreto, verifique se segue padrão: example@example.com!", on: self)
            } else if error == .genericError {
                self.injection.alerts.showAlert(titulo: "Algo aconteceu", mensagem: "Não foi possível realizar o login, por favor tente novamente!", on: self)
            }
            
            self.stopLoading()
        }
    }
    
    private func stopLoading(){
        self.btLogin.isHidden = false
        self.loading.isHidden = true
        self.loading.stopAnimating()
    }
    
    
    
    
}

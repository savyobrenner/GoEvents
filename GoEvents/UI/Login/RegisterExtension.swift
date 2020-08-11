extension RegisterViewController {
    
     func validateForms(){
           let nameIsEmpty = tfName.text?.isEmpty ?? true
           let emailIsEmpty = tfEmail.text?.isEmpty ?? true
           let passwordIsEmpty = tfPassword.text?.isEmpty ?? true
           let confirmPasswordIsEmpty = tfConfirmPassowrd.text?.isEmpty ?? true
           let matchPasswords = (tfPassword.text! == tfConfirmPassowrd.text!)
           self.loading.startAnimating()
           self.loading.isHidden = false
           self.btRegister.isHidden = true
           
           if(nameIsEmpty){
               injection.alerts.showAlert(titulo: "Dado Inválido", mensagem: "O campo nome não pode ser vazio", on: self)
               self.stopLoading()
           } else if(emailIsEmpty) {
               injection.alerts.showAlert(titulo: "Dado Inválido", mensagem: "O campo email não pode ser vazio", on: self)
               self.stopLoading()
           } else if (passwordIsEmpty) {
               injection.alerts.showAlert(titulo: "Dado Inválido", mensagem: "O campo senha e/ou confirmação de senha não podem ser vazio", on: self)
               self.stopLoading()
           } else if (confirmPasswordIsEmpty) {
               injection.alerts.showAlert(titulo: "Dado Inválido", mensagem: "O campo senha e/ou confirmação de senha não podem ser vazio", on: self)
               self.stopLoading()
           } else if (!matchPasswords){
               injection.alerts.showAlert(titulo: "Dado inválído", mensagem: "Senhas não conferem!", on: self)
               self.stopLoading()
           } else if (tfPassword.text!.count < 6){
               injection.alerts.showAlert(titulo: "Dado inválido", mensagem: "A senha deve conter pelo menos 6 caracteres.", on: self)
               self.stopLoading()
           } else if (!swAge.isOn) {
               injection.alerts.showAlert(titulo: "Dado inválído", mensagem: "O cadastro de novos usuários só é permitido para maiores de 14 anos.", on: self)
               self.stopLoading()
           } else {
                self.performUserCreation()
           }
       }
      
       private func performUserCreation() {
              let name = tfName.text!
              let email = tfEmail.text!
              let password = tfPassword.text!
           
           injection.authenticationServices.createUser(email: email, password: password, onSuccess: { (uid) in
               self.injection.database.savePersonalInformations(name: name, uid: uid)
               
               self.injection.authenticationServices.verificationEmail {
                   
                   self.injection.alerts.showAlertWithDismiss(titulo: "Conta criada com suceeso!", mensagem: "Sua conta foi criada com sucesso, um email de confirmação foi enviado para o email informado, o login será possível após a confirmação.", on: self) {
                       self.dismiss(animated: true, completion: nil)
                   }
                   
                   self.stopLoading()
               }

           }) { (error) in
               if error == .FIRAuthErrorCodeEmailAlreadyInUse {
                   self.injection.alerts.showAlert(titulo: "Conta não criada", mensagem: "O email informado já possui uma conta em nosso banco de dados.", on: self)
               } else if error == .FIRAuthErrorCodeInvalidEmail{
                   self.injection.alerts.showAlert(titulo: "Conta não criada", mensagem: "O email informado está incorreto, certifique-se que segue o modelo: example@example.com!", on: self)
               } else if error == .genericError {
                   self.injection.alerts.showAlert(titulo: "Conta não criada", mensagem: "Não foi possível criar sua conta, tente novamente.", on: self)
               }
               self.stopLoading()
           }
       }
       
       
       private func stopLoading(){
           self.btRegister.isHidden = false
           self.loading.isHidden = true
           self.loading.stopAnimating()
       }
    
}

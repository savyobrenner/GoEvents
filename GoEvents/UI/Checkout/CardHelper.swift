import UIKit

extension CardViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if(textField == tfMonth){
            let currentText = textField.text! + string
            return currentText.count <= 2
        } else if (textField == tfYear) {
            let currentText = textField.text! + string
            return currentText.count <= 2
        } else if (textField == tfCVV) {
            let currentText = textField.text! + string
            return currentText.count <= 3
        } else if (textField == tfCardNumber) {
            
            switch tfCardNumber.text?.prefix(1){
            case "4":
                ivCard.image = #imageLiteral(resourceName: "visa (1)")
            case "5":
                ivCard.image = #imageLiteral(resourceName: "mastercard")
            case "":
                ivCard.image = #imageLiteral(resourceName: "card")
            default:
                ivCard.image = #imageLiteral(resourceName: "card")
            }
            let currentText = textField.text! + string
            return currentText.count <= 16
        }
        
        return true;
    }
    
    func validateIfFormsIsEmpty(){
        let cardNumberIsEmpty = tfCardNumber.text?.isEmpty ?? true
        let cardHolderIsEmpty = tfCardHolderName.text?.isEmpty ?? true
        let month = tfMonth.text?.isEmpty ?? true
        let year = tfYear.text?.isEmpty ?? true
        let cvv = tfCVV.text?.isEmpty ?? true
        
        if(cardNumberIsEmpty) {
            injection.alerts.showAlert(titulo: "Dado Inválido", mensagem: "O campo número do cartão está vazio", on: self)
        } else if (cardHolderIsEmpty) {
            injection.alerts.showAlert(titulo: "Dado Inválido", mensagem: "O campo titular do cartão está vazio", on: self)
        } else if (month){
            injection.alerts.showAlert(titulo: "Dado inválido", mensagem: "O campo mês está vazio.", on: self)
        } else if (year){
            injection.alerts.showAlert(titulo: "Dado inválido", mensagem: "O campo ano está vazio.", on: self)
        }else if (cvv){
            injection.alerts.showAlert(titulo: "Dado inválido", mensagem: "O campo CVV está vazio.", on: self)
        } else {
            self.performPayment()
        }
    }
    
    func performPayment(){
        injection.database.addTicket(event: event, uid: injection.authenticationServices.currentUserUid(), onSuccess: {
            self.injection.alerts.showAlertWithCompletion(titulo: "Compra com sucesso", mensagem: "A compra foi realizada com sucesso, cheque seus ingressos na tela 'Ingressos'.", on: self) {
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
            self.stopLoading()
        }) {
            self.injection.alerts.showAlert(titulo: "Algo aconteceu", mensagem: "Não foi possível concluir a compra, tente novamente", on: self)
            self.stopLoading()
        }
    }
    
    func stopLoading(){
        self.loading.isHidden = true
        self.btBuy.isHidden = false
        self.loading.stopAnimating()
    }

}

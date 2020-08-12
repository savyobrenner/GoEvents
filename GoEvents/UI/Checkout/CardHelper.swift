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
    
    
    
}

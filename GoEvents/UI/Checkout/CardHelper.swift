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
        }
        
        return true;
    }
    
}

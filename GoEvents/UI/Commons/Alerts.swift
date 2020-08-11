import Foundation
import UIKit

class Alerts{
    
    func showAlert(titulo: String, mensagem: String, `on` controller: UIViewController){
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
    }
    
}

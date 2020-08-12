import Foundation
import UIKit

class Loading {
    
    func startLoad(element: UIActivityIndicatorView, completion: (() -> Void)? = nil){
        element.color = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.737254902, alpha: 1)
        element.isHidden = false
        element.startAnimating()
        if (completion != nil) {
           completion!()
        }
    }
    
    func stopLoading(element: UIActivityIndicatorView){
        element.stopAnimating()
        element.isHidden = true
    }
}


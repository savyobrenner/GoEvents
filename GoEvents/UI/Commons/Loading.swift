import Foundation
import UIKit

class Loading {
    
    func startLoad(element: UIActivityIndicatorView, completion: (() -> Void)? = nil){
        element.color = .darkGray
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


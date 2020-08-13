import UIKit

class TicketsDetailsViewController: UIViewController {
    
    @IBOutlet weak var ivQrCode: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    
    var name: String!, date: String!, uid: String!
    
    let injection = Injection()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
}

import UIKit

class TicketsDetailsViewController: UIViewController {
    
    @IBOutlet weak var ivQrCode: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    
    var name: String!, date: String!, uid: String!
    
    
    let injection = Injection()

    override func viewDidLoad() {
        super.viewDidLoad()
        let treatEventName = name.folding(options: .diacriticInsensitive, locale: .current)
        let personalCode = uid + treatEventName + date
        ivQrCode.image = generateQRCode(from: personalCode)
        lbName.text = name
        lbDate.text = date

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

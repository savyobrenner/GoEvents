import UIKit
import Kingfisher

class TicketsTableViewController: UITableViewController {
    
    var eventName:[String] = [], date:[String] = [], quantity:[Int] = [], image:[String] = []
    
    let injection = Injection()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
       retrieveData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return eventName.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TicketCell
        
        cell.lbEventName.text = eventName[indexPath.row]
        cell.lbEventDate.text = date[indexPath.row]
        cell.lbTicketsQuantity.text = "Ingressos comprados: " + String(quantity[indexPath.row])
        cell.configImage(with: image[indexPath.row])

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let uid = injection.authenticationServices.currentUserUid()
        if segue.identifier == "ticketsDetails"{
            let vc = segue.destination as! TicketsDetailsViewController
            let indexPath = tableView.indexPathForSelectedRow
            vc.date = date[indexPath!.row]
            vc.name = eventName[indexPath!.row]
            vc.uid = uid
            tableView.deselectRow(at: indexPath!, animated: true)
        }
    }
    
    func retrieveData(){
        let uid = injection.authenticationServices.currentUserUid()
               injection.database.getAllTickets(uid: uid, onSuccess: { (name, date, quantity, image)  in
                   self.eventName = name
                   self.date = date
                   self.quantity = quantity
                   self.image = image
                self.tableView.reloadData()
               }) {
                   print("error")
               }
    }

}

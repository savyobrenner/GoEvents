import UIKit

class TicketsTableViewController: UITableViewController {
    
    let spinner = UIActivityIndicatorView(style: .large)
    
    var eventName:[String] = [], date:[String] = [], quantity:[Int] = [], image:[String] = []
    
    let injection = Injection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkUser()
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
        injection.loading.startLoad(element: spinner) {
            self.tableView.backgroundView = self.spinner
        }
        injection.database.getAllTickets(uid: uid, onSuccess: { (name, date, quantity, image)  in
            self.eventName = name
            self.date = date
            self.quantity = quantity
            self.image = image
            self.injection.loading.stopLoading(element: self.spinner)
            self.tableView.reloadData()
        }) {
            self.injection.alerts.showAlert(titulo: "Algo aconteceu", mensagem: "Não foi possivel listar seus ingressos, tente novamente", on: self)
            self.injection.loading.stopLoading(element: self.spinner)
        }
    }
    func checkUser(){
        let label = UILabel()
        label.text = "Para ter acesso aos seus ingresso, realize o login antes."
        label.numberOfLines = 0
        label.textAlignment = .center
        injection.authenticationServices.isAlreadyLogged(onSuccess: {
        self.retrieveData()
        label.isHidden = true
        }) {
            self.tableView.backgroundView = label
            label.isHidden = false
            self.eventName.removeAll()
            self.date.removeAll()
            self.quantity.removeAll()
            self.image.removeAll()
            self.tableView.reloadData()
        }
    }
    
}

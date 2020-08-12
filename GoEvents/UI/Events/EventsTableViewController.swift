import UIKit

class EventsTableViewController: UITableViewController {
    
    let injection = Injection()
    var events: [Events] = []
    let spinner = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        injection.loading.startLoad(element: spinner) {
            self.tableView.backgroundView = self.spinner
        }
        loadEvents()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventsTableViewCell
        let event = events[indexPath.row]
        cell.prepare(with: event)
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "eventDetails"{
            let indexPath = tableView.indexPathForSelectedRow!
            let event = events[indexPath.row]
            let vc = segue.destination as! EventsDetailsViewController
            prepareInformationForSegue(vc: vc, event: event)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    func loadEvents(){
        DispatchQueue.main.async {
            self.injection.eventsService.getEvents(onSucess: { (events) in
                     self.events = events
                     self.tableView.reloadData()
                self.injection.loading.stopLoading(element: self.spinner)
                 }) { (error) in
                     print(error)
                 }
             }
    }
}

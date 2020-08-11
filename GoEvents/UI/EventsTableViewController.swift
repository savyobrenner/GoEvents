import UIKit

class EventsTableViewController: UITableViewController {
    
    let injection = Injection()
    var events: [Events] = []

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func loadEvents(){
        DispatchQueue.main.async {
            self.injection.eventsService.getEvents(onSucess: { (events) in
                     self.events = events
                     self.tableView.reloadData()
                 }) { (error) in
                     print(error)
                 }
             }
    }
}

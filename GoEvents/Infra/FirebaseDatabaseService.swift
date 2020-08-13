import Foundation
import Firebase

class FirebaseDatabaseService: DatabaseService {
  
    private let ref = Database.database().reference()
    
    func savePersonalInformations(name: String, uid: String, email: String) {
        ref.child("Users").child(uid).setValue(["name": name, "email": email])
    }
    
    func getName(uid: String, onSuccess: @escaping (String) -> Void) {
        
         ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                   
                   let value = snapshot.value as? NSDictionary
                   let name = value?["name"] as? String ?? ""
                   onSuccess(name)
               })
    }
    
    func getEmail(uid: String, onSuccess: @escaping (String) -> Void)  {
    
        ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let email = value?["email"] as? String ?? ""
            onSuccess(email)
        })
      }
    
    func addTicket(event: Events, uid: String, onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        
        let dicOfData = ["eventName": event.eventName, "date": event.date, "price": event.price, "image": event.image, "finalPrice": event.finalPrice!] as [String : Any]
        
        ref.child("Users").child(uid).child("Tickets").childByAutoId().setValue(dicOfData) { (error, snapshot) in
            if error == nil {
                onSuccess()
            } else {
                onError()
            }
        }
      }
    
    func getAllTickets(uid: String, onSuccess: @escaping ([String],[String],[Int],[String],[String]) -> Void, onError: @escaping ()-> Void){
        
        var eventName:[String] = [], date:[String] = [], price:[Int] = [], image:[String] = [], finalPrice:[String] = []
        
        ref.child("Users").child(uid).child("Tickets").observe(.value, with: { (snapshot) in
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let userObjecg = data.value as? [String: AnyObject]
                let name = userObjecg!["eventName"] as! String
                eventName.append(name)
                let eventDate = userObjecg!["date"] as! String
                date.append(eventDate)
                let eventPrice = userObjecg!["price"] as! Int
                price.append(eventPrice)
                let eventImage = userObjecg!["imagem"] as! String
                image.append(eventImage)
                let eventFinalPrice = userObjecg!["finalPrice"] as! String
                finalPrice.append(eventFinalPrice)
            }
            onSuccess(eventName, date, price, image, finalPrice)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}

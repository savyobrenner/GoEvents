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
    
    func addTicket(event: Events, uid: String, name:String, onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        
        let dicOfData = ["eventName": event.eventName, "eventDescription": event.eventDescription, "date": event.date, "startTime": event.startTime, "endTime": event.endTime, "location": event.location, "price": event.price,"producer": event.producer, "imagem": event.image, "finalPrice": event.finalPrice!] as [String : Any]
        
        ref.child("Users").child(uid).child(name).child("Tickets").childByAutoId().setValue(dicOfData) { (error, snapshot) in
            if error == nil {
                onSuccess()
            } else {
                onError()
            }
        }
      }
    
}

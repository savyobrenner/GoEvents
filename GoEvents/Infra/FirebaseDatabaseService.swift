import Foundation
import Firebase

class FirebaseDatabaseService: DatabaseService {
  
    let ref = Database.database().reference()
    
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
    
}

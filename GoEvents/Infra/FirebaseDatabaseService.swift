import Foundation
import Firebase

class FirebaseDatabaseService: DatabaseService {
  
    let ref = Database.database().reference()
    
    func savePersonalInformations(name: String, uid: String, email: String) {
        ref.child("Users").child(uid).setValue(["name": name, "email": email])
    }
    
    func getName(uid: String) -> String {
        
        var name: String?

        ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            name = value?["name"] as? String ?? ""
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        return name!
        
    }
    
    func getEmail(uid: String) -> String {
          
        var email: String?

        ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            email = value?["email"] as? String ?? ""
        }) { (error) in
            print(error.localizedDescription)
        }
        
        return email!
      }
      
    
    
}

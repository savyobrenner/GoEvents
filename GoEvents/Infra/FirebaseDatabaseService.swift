import Foundation
import Firebase

class FirebaseDatabaseService: DatabaseService {
    
    let ref = Database.database().reference()
    
    func savePersonalInformations(name: String, uid: String) {
        ref.child("Users").child(uid).setValue(["name": name])
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
    
    
}

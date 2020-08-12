import Foundation

protocol DatabaseService {
    
    func savePersonalInformations(name: String, uid: String, email: String)
    
    func getName(uid: String) -> String
    
    func getEmail(uid: String) -> String
    
}

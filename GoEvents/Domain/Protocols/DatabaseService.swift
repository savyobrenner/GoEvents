import Foundation

protocol DatabaseService {
    
    func savePersonalInformations(name: String, uid: String)
    
    func getName(uid: String) -> String
    
}

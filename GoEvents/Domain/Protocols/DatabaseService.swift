import Foundation

protocol DatabaseService {
    
    func savePersonalInformations(name: String, uid: String, email: String)
    
    func getName(uid: String, onSuccess: @escaping (String) -> Void)
    
    func getEmail(uid: String, onSuccess: @escaping (String) -> Void)
    
}

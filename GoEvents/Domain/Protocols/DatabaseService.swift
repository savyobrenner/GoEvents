import Foundation

protocol DatabaseService {
    
    func savePersonalInformations(name: String, uid: String, email: String)
    
    func getName(uid: String, onSuccess: @escaping (String) -> Void)
    
    func getEmail(uid: String, onSuccess: @escaping (String) -> Void)
    
    func addTicket(event: Events, uid: String, onSuccess: @escaping ()-> Void, onError: @escaping ()-> Void)
    
    func getAllTickets(uid: String, onSuccess: @escaping ([String],[String],[Int],[String],[String]) -> Void, onError: @escaping ()-> Void)
        
}

import Foundation

protocol AuthenticationService {
    
    func createUser(email: String, password: String, onSuccess: @escaping  (String) -> Void, onError: @escaping (AuthenticationError) -> Void)
    
    func login (email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (AuthenticationError) -> Void)
    
    func isAlreadyLogged(onSucess: @escaping () -> Void)
    
    func logoutUser(onSuccess: () -> Void, onError: () -> Void) -> Void
    
    func recoveryThePassowrd(email: String, onSuccess: @escaping () -> Void, onError: @escaping () -> Void) -> Void
    
    func currentUserUid() -> String
    
    func verificationEmail (onSuccess: @escaping () -> Void)
    
}

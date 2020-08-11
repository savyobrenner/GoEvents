import Foundation
import Firebase

class FirebaseAuthenticationService: AuthenticationService {
    private let auth = Auth.auth()
    
    func createUser(email: String, password: String, onSuccess: @escaping (String) -> Void, onError: @escaping (AuthenticationError) -> Void) {
        auth.createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                let userUID = user?.user.uid
                onSuccess(userUID ?? "")
            } else {
                let tError = error.debugDescription
                if tError == "FIRAuthErrorCodeInvalidEmail"{
                    onError(.FIRAuthErrorCodeEmailAlreadyInUse)
                } else if tError == "FIRAuthErrorCodeEmailAlreadyInUse"{
                    onError(.FIRAuthErrorCodeEmailAlreadyInUse)
                } else if tError == "FIRAuthErrorCodeWeakPassword"{
                    onError(.FIRAuthErrorCodeWeakPassword)
                }
            }
        }
    }
    
    func login(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (AuthenticationError) -> Void) {
        auth.signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                onSuccess()
            } else {
            let tError = error.debugDescription
            if tError == "FIRAuthErrorCodeInvalidEmail"{
                onError(.FIRAuthErrorCodeInvalidEmail)
            } else if tError == "FIRAuthErrorCodeWrongPassword"{
                onError(.FIRAuthErrorCodeWrongPassword)
            }
        }
    }
    }
    
    func isAlreadyLogged(onSucess: @escaping () -> Void) {
        auth.addStateDidChangeListener { (auth, user) in
            if user != nil {
                onSucess()
            }
        }
    }

    func logoutUser(onSuccess: () -> Void, onError: () -> Void) {
         do {
                   try self.auth.signOut()
                   onSuccess()
               }catch{
                   onError ()
               }
        }
    
    func recoveryThePassowrd(email: String, onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        auth.sendPasswordReset(withEmail: email) { error in
            if error == nil{
                onSuccess()
            }else{
                print(error as Any)
                onError()
            }
        }
    }
    
    func currentUserUid() -> String {
        return auth.currentUser?.uid ?? "Sem usuário Logado"
    }
    
    func verificationEmail (onSuccess: @escaping () -> Void){
        auth.currentUser?.sendEmailVerification(completion: { (error) in
            if error == nil {
                onSuccess()
            }
        })
    }
}

import Foundation
import Firebase

class FirebaseAuthenticationService: AuthenticationService {
    public let auth = Auth.auth()
    
    func createUser(email: String, password: String, onSuccess: @escaping (String) -> Void, onError: @escaping (AuthenticationError) -> Void) {
        auth.createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                let userUID = user?.user.uid
                onSuccess(userUID ?? "")
            } else {
                let tError = error?.localizedDescription
                if tError == "The email address is badly formatted."{
                    onError(.FIRAuthErrorCodeInvalidEmail)
                } else if tError == "The email address is already in use by another account." {
                    onError(.FIRAuthErrorCodeEmailAlreadyInUse)
                } else {
                    onError(.genericError)
                }
            }
        }
    }
    
    func login(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (AuthenticationError) -> Void) {
        auth.signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                onSuccess()
            } else {
                let tError = error?.localizedDescription
                if tError == "There is no user record corresponding to this identifier. The user may have been deleted."{
                    onError(.emailNotRegistred)
                } else if tError == "The password is invalid or the user does not have a password."{
                    onError(.FIRAuthErrorCodeWrongPassword)
                } else if tError == "The email address is badly formatted."{
                    onError(.FIRAuthErrorCodeInvalidEmail)
                } else {
                    onError(.genericError)
                }
            }
        }
    }
    
    func isAlreadyLogged(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        auth.addStateDidChangeListener { (auth, user) in
            if user != nil {
                if user!.isEmailVerified {
                    onSuccess()
                } else {
                    onError()
                }
            } else {
                onError()
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
    
    func recoveryThePassowrd(email: String, onSuccess: @escaping () -> Void, onError: @escaping (AuthenticationError) -> Void) {
        auth.sendPasswordReset(withEmail: email) { error in
            if error == nil{
                onSuccess()
            } else{
                let tError = error?.localizedDescription
                if tError == "The email address is badly formatted." {
                    onError(.FIRAuthErrorCodeInvalidEmail)
                } else if tError == "There is no user record corresponding to this identifier. The user may have been deleted."{
                    onError(.emailNotRegistred)
                } else {
                    onError(.genericError)
                }
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

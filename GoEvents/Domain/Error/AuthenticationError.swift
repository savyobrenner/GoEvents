import Foundation

public enum AuthenticationError {
    case FIRAuthErrorCodeInvalidEmail
    case FIRAuthErrorCodeEmailAlreadyInUse
    case FIRAuthErrorCodeWeakPassword
    case FIRAuthErrorCodeWrongPassword
}

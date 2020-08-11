import Foundation

public enum AuthenticationError {
    case FIRAuthErrorCodeInvalidEmail
    case FIRAuthErrorCodeEmailAlreadyInUse
    case genericError
    case FIRAuthErrorCodeWrongPassword
}

import Foundation

public enum DataError {
    case urlNotFound
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
    case serverNotAvailable
}

import Foundation

protocol ImageService {
    func getImage(onSucess: @escaping () -> Void, onError: @escaping () -> Void )
}

import Foundation

protocol EventsService {
    func getEvents(onSucess: @escaping ([Events]) -> Void, onError: @escaping (DataError) -> Void )
}

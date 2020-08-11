import Foundation

class AlamofireEventsService: EventsService {
    
    let client: ClientFactory
    
    init(client: ClientFactory) {
        self.client = client
    }
    
    
    func getEvents(onSucess: @escaping ([Events]) -> Void, onError: @escaping (DataError) -> Void) {
        client.create(type: [Events].self, onSuccess: { (events) in
            onSucess(events)
        }) { (error) in
            onError(error.self)
        }
    }
    
}

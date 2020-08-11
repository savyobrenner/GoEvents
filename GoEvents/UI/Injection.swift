class Injection {
    
    let clientInstance = ClientFactory()
    let eventsService: AlamofireEventsService
    init() {
        eventsService = AlamofireEventsService(client: clientInstance)
    }

}
    

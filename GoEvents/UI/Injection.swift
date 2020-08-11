class Injection {
    
    let clientInstance = ClientFactory()
    let eventsService: AlamofireEventsService
    let loading = Loading()
    
    init() {
        eventsService = AlamofireEventsService(client: clientInstance)
    }

}
    

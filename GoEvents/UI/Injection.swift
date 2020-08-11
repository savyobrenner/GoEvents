class Injection {
    
    let clientInstance = ClientFactory()
    let eventsService: AlamofireEventsService
    let loading = Loading()
    let authenticationServices = FirebaseAuthenticationService()
    let alerts = Alerts()
    let database = FirebaseDatabaseService()
    
    init() {
        eventsService = AlamofireEventsService(client: clientInstance)
    }

}
    

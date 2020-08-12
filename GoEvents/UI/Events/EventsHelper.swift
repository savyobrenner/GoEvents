extension EventsTableViewController {
    
    func prepareInformationForSegue(vc: EventsDetailsViewController, event: Events?){
        vc.eventName = event?.eventName
        vc.date = event?.date
        vc.eventDescription = event?.eventDescription
        vc.image = event?.image
        vc.location = event?.location
        vc.price = event?.price
        vc.producerName = event?.producer
        vc.startTime = event?.startTime
        vc.endTime = event?.endTime
    }
}

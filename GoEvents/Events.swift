import Foundation

struct Events: Codable {
    let eventName: String
    let eventDescriptio: String
    let date: String
    let startTime: String
    let endTime: String
    let location: String
    let price: Int
    let producer: String
    let image: String
}

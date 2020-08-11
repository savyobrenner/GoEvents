import Foundation
import Alamofire


enum HttpCodes: Int {
    case success = 200
    case routeNotFound = 404
    case serveError = 500
}

class ClientFactory {
    
    private let url = "hhttps://goevents-b64cb.firebaseio.com/Events.json"
    
    
    func create<ResponseType: Codable>(type: ResponseType.Type,onSuccess: @escaping (ResponseType) -> Void, onError: @escaping (DataError) -> Void) {
        
        AF.request(url).responseJSON { (response) in
            guard let urlResponse = response.response else {
                onError(.noData)
                return
            }
            if urlResponse.statusCode == HttpCodes.success.rawValue {
                let eventsDataValue = response.data
                do {
                    let eventsData = try JSONDecoder().decode(ResponseType.self, from: eventsDataValue!)
                    onSuccess(eventsData)
                }catch{
                    print(error.localizedDescription)
                    onError(.invalidJSON)
                }
            } else if urlResponse.statusCode == HttpCodes.routeNotFound.rawValue {
                onError(.urlNotFound)
                return
            } else if urlResponse.statusCode == HttpCodes.serveError.rawValue {
                onError(.serverNotAvailable)
                return
            }
        }
    }
}

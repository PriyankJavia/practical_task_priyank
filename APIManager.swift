

import Foundation
import Alamofire

class APIManager: NSObject {
    
    let API_URL = "https://api.npoint.io/368124fffd7ae70f3b57"
    
    static let shared = APIManager()
    
    
    func callAPI(success : @escaping (([PersonDetails]) -> ())){

        URLCache.shared.removeAllCachedResponses()
        
        var request = URLRequest(url: URL(string: API_URL)!)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLCache.shared.removeAllCachedResponses()
        
        AF.request(request).responseString { responseStr in
            
            switch responseStr.result {
            case .success(let getData):
                if let data = getData.data(using: .utf8) {
                    do {
                        let decoder = JSONDecoder()
                        let dataModel = try decoder.decode([PersonDetails].self, from: data)
                        debugPrint(dataModel)
                        success(dataModel)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

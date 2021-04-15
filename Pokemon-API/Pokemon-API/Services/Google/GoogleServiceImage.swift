import UIKit

class GoogleSearchImageService : GoogleSearchImageServiceProtocol {
    
    static func getImage(with string: String, completion: @escaping (UIImage?) -> Void) {
        guard let request = GoogleSearchImage.constructRequest(with: string) else {
            completion(UIImage(systemName: "xmark"))
            return
        }
        
        NetworkManager.request(with: request) { (result) in
            
            switch result {
            case .success(let data):
                if let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let items = json["items"] as? [[String: Any]], let link = items[0]["link"] as? String {
                        
                        let url = URL(string: link)
                        NetworkManager.request(with: url) { (result) in
                            
                            switch result {
                            case .success(let data):
                                completion(UIImage(data: data))
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

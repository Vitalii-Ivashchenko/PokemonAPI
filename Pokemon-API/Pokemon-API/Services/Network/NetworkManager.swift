import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    typealias CompletionHandler = (Result<Data, NetworkManagerError>) -> Void
    
    static func request(with url: URL?, completion: @escaping CompletionHandler) {
        guard let url = url else {
            completion(.failure(.incorrectURL))
            return
        }
        
        let request = URLRequest(url: url)
        dataTask(with: request) { data in
            completion(data)
        }
    }
    
    static func request(with request: URLRequest, completion: @escaping CompletionHandler) {
        dataTask(with: request) { data in
            completion(data)
        }
    }
    
    private static func dataTask(with request: URLRequest, completion: @escaping CompletionHandler) {
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                NSLog("\(#file). \(error)")
                DispatchQueue.main.async {
                    completion(.failure(.requestError))
                }
            } else {
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(.emptyData))
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            }
        }.resume()
    }
}

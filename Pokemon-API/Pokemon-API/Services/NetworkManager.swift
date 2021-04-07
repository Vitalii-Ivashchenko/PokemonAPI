import Foundation

class NetworkManager {
    
    static func request<T: Decodable>(decodeType: T.Type, urlString: String, completion: @escaping (Result<T, NetworkManagerError>) -> Void) {
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completion(.failure(.incorrectURL))
            }
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(#file, "error:", error)
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
                
                do {
                    let decoder = try JSONDecoder().decode(decodeType, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decoder))
                    }
                } catch {
                    print(#file, "error:", error)
                }
            }
        }.resume()
    }
}

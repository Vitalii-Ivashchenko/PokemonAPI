//
//  NetworkManager.swift
//  Pokemon-API
//
//  Created by Віталій on 25.03.2021.
//

import Foundation

class NetworkManager {
    
    static func request<T: Decodable>(type: T.Type, urlString: String, completion: @escaping ((Result<T, NetworkError>)?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = try JSONDecoder().decode(type, from: data)
                    completion(.success(decoder))
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

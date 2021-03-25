//
//  NetworkError.swift
//  Pokemon-API
//
//  Created by Віталій on 25.03.2021.
//

import Foundation

enum NetworkError: Error {
    
    case connectionError
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .connectionError: return "Error with connection"
        }
    }
}

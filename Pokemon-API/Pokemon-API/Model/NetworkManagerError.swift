import Foundation

enum NetworkManagerError: Error {
    
    case emptyData
    case incorrectURL
    case requestError
}

extension NetworkManagerError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .emptyData:
            return "Data is empty"
        case .incorrectURL:
            return "Incorrect URL"
        case .requestError:
            return "Request error"
        }
    }
}

import Foundation

protocol NetworkManagerProtocol {
    static func request(with url: URL?, completion: @escaping (Result<Data, NetworkManagerError>) -> Void)
}

import Foundation

protocol GoogleSearchImageProtocol {
    static func constructRequest(with searchString: String) -> URLRequest?
}

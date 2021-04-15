import UIKit

protocol GoogleSearchImageServiceProtocol {
    static func getImage(with string: String, completion: @escaping (UIImage?) -> Void)
}

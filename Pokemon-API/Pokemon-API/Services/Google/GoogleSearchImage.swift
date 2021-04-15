import Foundation

class GoogleSearchImage: GoogleSearchImageProtocol {
    
    static private let limitResults = 1
    static private let apiKey = "AIzaSyAutyBO1nKj3TS6D9gJHxpB6PLY44ZzN70"
    static private let cx = "a9c734f58c720acac"
    
    static func constructRequest(with searchString: String) -> URLRequest? {
        guard let url = constructURL(with: searchString) else { return nil }
        var request = URLRequest(url: url)
        request.addValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "X-Ios-Bundle-Identifier")
        return request
    }
    
    private static func constructURL(with searchString: String) -> URL? {
        let urlString = URLConstructor(sourcePath: "https://www.googleapis.com/customsearch/v1")
        urlString.append(key: "q", with: searchString)
        urlString.append(key: "num", with: String(limitResults))
        urlString.append(key: "key", with: apiKey)
        urlString.append(key: "cx", with: cx)
        urlString.append(key: "searchType", with: "image")
        urlString.append(key: "alt", with: "json")
        
        return URL(string: urlString.fullURLPath)
    }
}

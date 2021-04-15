import Foundation

class URLConstructor {
    
    private(set) var sourcePath = ""
    private(set) var parameters = ""
    
    var fullURLPath: String {
        return sourcePath + parameters
    }
    
    init(sourcePath: String) {
        self.sourcePath = sourcePath
    }
    
    func append(key: String, with value: String) {
        parameters += parameters.isEmpty ? "?" : "&"
        parameters += key + "=" + value
    }
}

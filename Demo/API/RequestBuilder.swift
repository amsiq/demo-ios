import Foundation

class RequestBuilder {
    class func getApiComponents(path: String, queryItems: [URLQueryItem]?) -> URLComponents {
        var urlComponents = URLComponents()

        let baseUrl = URL(string: "http://localhost:7000")!

        urlComponents.scheme = baseUrl.scheme!
        urlComponents.host = baseUrl.host!
        urlComponents.port = baseUrl.port
        urlComponents.path = "\(baseUrl.path)\(path)"
        urlComponents.queryItems = queryItems

        return urlComponents
    }
}

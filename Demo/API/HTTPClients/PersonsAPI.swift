import Alamofire
import RealmSwift
import RxAlamofire
import RxSwift
import SwiftyJSON

class PersonsAPI {

    class func get() -> Observable<JSON> {
        let urlComponents = RequestBuilder.getApiComponents(path: "/persons", queryItems: nil)

        let manager = NetworkManager.shared.manager
        return manager.rx.request(.get, urlComponents.url!, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .flatMap {
                $0
                    .validate(statusCode: 200 ..< 300)
                    .validate(contentType: ["application/json"])
                    .rx.json()
            }
            .map { data in
                return JSON(data)
            }
    }
}

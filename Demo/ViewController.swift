import UIKit
import RealmSwift
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = Realm.create()
        
        _ = PersonsAPI.get()
            .subscribe(onNext: { (json) in
                print("RxSwift onNext:\n\(json.prettyPrintedString())")

                let personsJson = json["persons"]

                // Persist
                realm.safeWrite {
                    let persons = personsJson.arrayValue.map({ Person.parseAndPersist(json: $0, realm: realm) })

                    persons.forEach {
                        debugPrint("Saved: \($0.firstName) \($0.lastName) with animals: \(Array($0.animals.map({ $0.name })))")
                    }
                }

            }, onError: { (error) in
                debugPrint("RxSwift onError: \(error)")

            }, onCompleted: {
                debugPrint("RxSwift onCompleted")

            }, onDisposed: {
                debugPrint("RxSwift onDisposed")
            })
    }
}

import UIKit
import RealmSwift
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = Realm.create()
        
        // Create
        let json = self.getPersons()
        let personsJson = json["persons"]
        
        // Persist
        realm.safeWrite {
            let persons = personsJson.arrayValue.map({ Person.parseAndPersist(json: $0, realm: realm) })

            persons.forEach {
                debugPrint("Saved: \($0.firstName) \($0.lastName) with animals: \(Array($0.animals.map({ $0.name })))")
            }
        }
    }
            
            
    private func getPersons() -> JSON {
        let path = Bundle.main.path(forResource: "Persons", ofType: "json")!
        let jsonString = try! String(contentsOfFile: path, encoding: .utf8)
    
        return JSON(parseJSON: jsonString)
    }
    
}

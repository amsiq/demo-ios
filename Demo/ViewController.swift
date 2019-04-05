import UIKit
import RealmSwift
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = Realm.create()
        
        let personId = 1
        
        // Read
        if let readPerson = Person.load(realm: realm, id: personId) {
            debugPrint("Read person with id \(personId) has age: \(readPerson.age)")
        } else {
            debugPrint("Read person with id \(personId): NOT FOUND")
        }
        
        // Create
        let json = self.getPerson()
        let personJson = json["person"]
        
        // Persist
        realm.safeWrite {
            let managedPerson = Person.parseAndPersist(json: personJson, realm: realm)
            
            debugPrint("Wrote person with id \(personId) has animals: \(Array(managedPerson.animals).map({ $0.name }))")
        }
    }
            
            
    private func getPerson() -> JSON {
        let path = Bundle.main.path(forResource: "Person", ofType: "json")!
        let jsonString = try! String(contentsOfFile: path, encoding: .utf8)
    
        return JSON(parseJSON: jsonString)
    }
    
}

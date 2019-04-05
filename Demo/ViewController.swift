import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        let personId = 1
        
        // Read
        if let readPerson = Person.load(realm: realm, id: personId) {
            debugPrint("Read person with id \(personId) has age: \(readPerson.age)")
        } else {
            debugPrint("Read person with id \(personId): NOT FOUND")
        }
        
        // Create
        let person = Person()
        person.id = personId
        person.firstName = "Tim"
        person.lastName = "Cook"
        person.age = 58
        
        // Persist
        try! realm.write() {
            let managedPerson = realm.create(Person.self, value: person, update: true)
            
            debugPrint("Wrote person with id \(personId) has age: \(managedPerson.age)")
        }
    }
    
}

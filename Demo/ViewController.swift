import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        // Create
        let person = Person()
        person.id = 1
        person.firstName = "Tim"
        person.lastName = "Cook"
        person.age = 58
        
        // Persist
        try! realm.write() {
            let managedPerson = realm.create(Person.self, value: person, update: true)
            
            debugPrint("Wrote person has age: \(managedPerson.age)")
        }
    }
    
}

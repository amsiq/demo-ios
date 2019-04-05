import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        // Create
        let person = Person()
        person.firstName = "Tim"
        person.lastName = "Cook"
        person.age = 58
        
        // Persist
        try! realm.write() {
            let managedPerson = realm.create(Person.self, value: person)
            
            debugPrint("Wrote person has age: \(managedPerson.age)")
        }
    }
    
}

import RealmSwift

class Person: Object {
    override static func primaryKey() -> String? {
        return "id"
    }
    
    @objc dynamic var id: Int = 0 
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var age: Int = 0
}

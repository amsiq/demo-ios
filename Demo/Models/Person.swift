import RealmSwift

class Person: Object {
    override static func primaryKey() -> String? {
        return "id"
    }
    
    @objc dynamic var id: Int = 0 
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var age: Int = 0
    
    class func load(realm: Realm, id: Int) -> Person? {
        return realm.objects(Person.self).first(where: { $0.id == id })
    }
}

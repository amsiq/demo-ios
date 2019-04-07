import RealmSwift
import SwiftyJSON

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

    class func parseAndPersist(json: JSON, realm: Realm) -> Person {
        let dic = json.dictionaryObject! // handle optional?
        return realm.create(Person.self, value: dic, update: true)
    }
}

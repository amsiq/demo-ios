import RealmSwift

class Animal: Object {
    override static func primaryKey() -> String? {
        return "id"
    }

    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
}

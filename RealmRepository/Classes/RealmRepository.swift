//
//  Created by grishutin on 19/12/2017.
//  Copyright © 2017 bifit. All rights reserved.
//

import Foundation
import BaseRepository
import RealmSwift

public class RealmRepository<T: ModelEntity>: BaseRepository where T == T.EntityType.ModelEntityType, T: Object {

    public typealias EntityType = T.EntityType

    public init() { }

    public func save(item: T.EntityType) throws {
        let realm = try! Realm()
        try realm.write {
            realm.add(item.modelObject)
        }
    }

    public func saveSeveral(items: [T.EntityType]) throws {
        let realm = try! Realm()
        try realm.write {
            items.forEach {
                realm.add($0.modelObject, update: true)
            }
        }
    }

    public func update(block: @escaping () -> Void) throws {
        let realm = try! Realm()
        try realm.write {
            block()
        }
    }

    public func delete(predicate: NSPredicate) throws {
        let realm = try! Realm()
        try realm.write {
            realm.delete(realm.objects(T.self).filter(predicate))
        }
    }

    public func deleteAll() throws {
        let realm = try! Realm()
        try realm.write {
            realm.delete(realm.objects(T.self))
        }
    }

    public func fetch(predicate: NSPredicate?, sorted: Sorted?, page: (limit: Int, offset: Int)?) -> [T.EntityType] {
        let realm = try! Realm()
        var objects = realm.objects(T.self)

        if let predicate = predicate {
            objects = objects.filter(predicate)
        }

        if let sorted = sorted {
            objects = objects.sorted(byKeyPath: sorted.key, ascending: sorted.ascending)
        }

        guard let page = page, !objects.isEmpty, page.limit != 0 else { return objects.compactMap { $0.plainObject } }

        let limit = objects.count > page.offset + page.limit ? page.offset + page.limit : objects.count
        let offset = objects.count < page.offset ? objects.count : page.offset

        return objects[offset..<limit].compactMap { $0.plainObject }
    }

    public func fetchAll() -> [T.EntityType] {
        let realm = try! Realm()
        return realm.objects(T.self).compactMap { $0.plainObject }
    }
}

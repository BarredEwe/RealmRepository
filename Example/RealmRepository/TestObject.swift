//
//  TestObject.swift
//  RealmRepository_Example
//
//  Created by Grishutin Maksim on 03/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import BaseRepository
import RealmSwift
import RealmRepository

class TestObject: Object, ModelEntity {

    typealias EntityType = TestStruct

    @objc dynamic public var title = "Title"

    var plainObject: TestStruct { return TestStruct(title: title) }

    convenience required init(entity: EntityType) {
        self.init()
        self.title = entity.title
    }
}

struct TestStruct: Codable {
    var title = "Title"
}

extension TestStruct: Entity {
    typealias ModelEntityType = TestObject

    var modelObject: TestObject { return TestObject(entity: self) }
}

//
//  TestObject.swift
//  RealmRepository_Example
//
//  Created by Grishutin Maksim on 03/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import RealmSwift
import RealmRepository

class TestObject: Object, RealmEntity {
    var plainObject: TestStruct = TestStruct(modelObject: TestObject())

    typealias EntityType = TestStruct
}

struct TestStruct: Entity {
    var modelObject: TestObject

    typealias RealmEntityType = TestObject
}

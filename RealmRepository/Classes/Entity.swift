//
//  Created by grishutin on 19/12/2017.
//  Copyright © 2017 bifit. All rights reserved.
//

import Foundation

public protocol Entity {
    associatedtype RealmEntityType
    var modelObject: RealmEntityType { get }
}

public protocol RealmEntity {
    associatedtype EntityType
    var plainObject: EntityType { get }
}

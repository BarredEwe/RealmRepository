//
//  ViewController.swift
//  RealmRepository
//
//  Created by BarredEwe on 04/02/2019.
//  Copyright (c) 2019 BarredEwe. All rights reserved.
//

import UIKit
import RealmSwift
import RealmRepository

class ViewController: UIViewController {

    private let repository = RealmRepository<TestObject>()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


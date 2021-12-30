//
//  Item.swift
//  todo-app
//
//  Created by Gustavo Harff on 29/12/21.
//

import Foundation
import RealmSwift

class Item: Object, Identifiable {
    @objc dynamic var id = UUID()
    @objc dynamic var title = ""
    @objc dynamic var done = false
}

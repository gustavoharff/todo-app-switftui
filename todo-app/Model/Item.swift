//
//  Item.swift
//  todo-app
//
//  Created by Gustavo Harff on 29/12/21.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var title: String
    var done: Bool
}

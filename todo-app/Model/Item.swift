//
//  Item.swift
//  todo-app
//
//  Created by Gustavo Harff on 29/12/21.
//

import Foundation

class Item: ObservableObject {
    @Published var id = UUID()
    @Published var title = ""
    @Published var done = false
}

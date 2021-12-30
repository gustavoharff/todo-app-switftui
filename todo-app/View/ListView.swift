//
//  ListView.swift
//  todo-app
//
//  Created by Gustavo Harff on 29/12/21.
//

import SwiftUI

struct ListView: View {
    @State private var items: [Item] = [
        Item(title: "Lavar louça", done: false),
        Item(title: "Cortar a grama", done: false),
    ]
    
    var body: some View {
        List($items, id: \.id) { $item in
            Toggle("\(item.title)", isOn: $item.done)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

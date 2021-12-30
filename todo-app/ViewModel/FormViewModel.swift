//
//  FormViewModel.swift
//  todo-app
//
//  Created by Gustavo Harff on 30/12/21.
//

import Foundation
import RealmSwift
import SwiftUI

class FormViewModel: ObservableObject {
    @Published var id = UUID()
    @Published var title = ""
    @Published var done = false
    
    @Published var items: [Item] = []
    
    @Published var openNewForm = false
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let realm = try? Realm() else { return }
        
        let results = realm.objects(Item.self)
        
        self.items = results.compactMap({ (item) -> Item? in
            return item
        })
    }
    
    func addItem(presentation: Binding<PresentationMode>) {
        
        let item = Item()
        item.title = title
        item.done = done
        
        guard let realm = try? Realm() else { return }
        
        try? realm.write {
            
            realm.add(item)
            
            getItems()
        }
        
        presentation.wrappedValue.dismiss()
    }
}

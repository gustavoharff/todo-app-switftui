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
    
    @Published var formOpen = false
    
    @Published var updateItem: Item?
    
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
        
        guard let realm = try? Realm() else { return }
        
        try? realm.write {
            
            guard let availableObject = updateItem else {
                let item = Item()
                item.title = title
                item.done = done
                
                realm.add(item)
                
                return;
            }
            
            availableObject.title = title
            availableObject.done = done
        }
        
        getItems()
        
        presentation.wrappedValue.dismiss()
    }
    
    func deleteItem(item: Item) {
        
        guard let realm = try? Realm() else { return }
        
        try? realm.write {
            realm.delete(item)
            
            getItems()
        }
        
    }
    
    func setUpInitialData() {
        
        guard let updateData = updateItem else { return }
        
        id = updateData.id
        title = updateData.title
        done = updateData.done
    }
    
    func deInitData() {
        
        title = ""
        done = false
    }
}

//
//  FormView.swift
//  todo-app
//
//  Created by Gustavo Harff on 29/12/21.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var formViewModel: FormViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            
            List {
                
                Section(header: Text("Title")) {
                    
                    TextField("", text: $formViewModel.title)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(formViewModel.updateItem == nil ? "Create task" : "Update task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        formViewModel.addItem(presentation: presentation)
                    }, label: {
                        Text("Done")
                    })
                    
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
            }
        }
        .onAppear(perform: {
            formViewModel.setUpInitialData()
        })
        .onDisappear(perform: formViewModel.deInitData)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

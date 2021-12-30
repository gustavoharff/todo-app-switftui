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
            .navigationTitle("Create task")
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
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

//
//  Home.swift
//  todo-app
//
//  Created by Gustavo Harff on 30/12/21.
//

import SwiftUI

struct Home: View {
    @StateObject var formViewModel = FormViewModel()
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                
            }
            .navigationTitle("To-Do")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        formViewModel.openNewForm.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $formViewModel.openNewForm, content: {
                FormView()
                    .environmentObject(formViewModel)
            })
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

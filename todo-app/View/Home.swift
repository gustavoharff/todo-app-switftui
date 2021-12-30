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
                
                VStack(spacing: 15) {
                    
                    ForEach(formViewModel.items) { item in
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            Text(item.title)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(10)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                    }
                }
                .padding()
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

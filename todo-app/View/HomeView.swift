//
//  HomeView.swift
//  todo-app
//
//  Created by Gustavo Harff on 30/12/21.
//

import SwiftUI

struct HomeView: View {
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
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .contextMenu(menuItems: {
                            
                            Button(action: {
                                formViewModel.deleteItem(item: item)
                            }, label: {
                                
                                Text("Delete Item")
                            })
                            
                            Button(action: {
                                formViewModel.updateItem = item
                                formViewModel.formOpen.toggle()
                            }, label: {
                                
                                Text("Edit Item")
                            })
                        })
                    }
                }
                .padding()
            }
            .navigationTitle("To-Do")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        formViewModel.updateItem = nil
                        formViewModel.formOpen.toggle()
                    }) {
                        
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $formViewModel.formOpen, content: {
                FormView()
                    .environmentObject(formViewModel)
            })
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

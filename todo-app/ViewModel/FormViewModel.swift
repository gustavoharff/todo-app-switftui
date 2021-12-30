//
//  FormViewModel.swift
//  todo-app
//
//  Created by Gustavo Harff on 30/12/21.
//

import Foundation

class FormViewModel: ObservableObject {
    @Published var id = UUID()
    @Published var title = ""
    @Published var done = false
    
    @Published var openNewForm = false
}

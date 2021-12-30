//
//  FormView.swift
//  todo-app
//
//  Created by Gustavo Harff on 29/12/21.
//

import SwiftUI

struct FormView: View {
    @State private var title = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter a title", text: $title)
        }
        .padding()
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

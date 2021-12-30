//
//  HeaderView.swift
//  todo-app
//
//  Created by Gustavo Harff on 29/12/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("To-Do")
                .fontWeight(Font.Weight.bold)
            
            Spacer()
            
            Button(action: {
                print("pressed")
            }) {
                Image(systemName: "plus.app")
                    .font(.system(size: 24, weight: .regular))
            }
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.fixed(width: 375, height: 80))
    }
}

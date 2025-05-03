//
//  NewItemField.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/05/25.
//

import SwiftUI

struct NewItemField: View {
    @State var newItem: String = K.emptyString
    
    var body: some View {
        HStack {
            // TODO: Check mark
            Image(systemName: "circle")
                .padding([.leading, .trailing])
            
            // New item search field
            TextField(K.listsSearchPlaceholderLabel, text: $newItem)
                .textFieldStyle(.plain)
        }
        .padding(.top)
    }
}

#Preview {
    NewItemField()
}

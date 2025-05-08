//
//  NewTagSection.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/05/25.
//

import SwiftUI

struct NewTagSection: View {
    @Environment(\.dismiss) var dismiss
    @State var tagName = K.emptyString
    @State var color = Color.yellow
    
    var body: some View {
        // Fields
        Section {
            // Name
            TextField("New Tag", text: $tagName)
            
            // Color
            ColorPicker("Color", selection: $color)
        } header: {
            Text("Create tags")
        } footer: {
            Text("Choose a name and a color to create a new tag.")
        }
        
        // Controls
        Section {
            HStack {
                Spacer()
                
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.borderless)
                .clipShape(.rect(cornerRadius: 40))
                .padding(.horizontal)
                
                // TODO: Add button
                Button("Add") {
                    
                }
                .buttonStyle(.borderedProminent)
                .clipShape(.rect(cornerRadius: 40))
            }
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    List {
        NewTagSection(tagName: K.emptyString, color: .yellow)
    }
}


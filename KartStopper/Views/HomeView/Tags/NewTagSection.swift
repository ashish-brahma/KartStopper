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
            TextField(K.tagsTextFieldPlaceholder, text: $tagName)
            
            // Color
            ColorPicker(K.tagsColorPickerLabel, selection: $color)
        } header: {
            Text(K.tagsCreateTagsHeader)
        } footer: {
            Text(K.tagsCreateTagsFooter)
        }
        
        // Controls
        Section {
            HStack {
                Spacer()
                
                // Cancel button
                Button(K.tagsCancelButtonLabel) {
                    dismiss()
                }
                .buttonStyle(.borderless)
                .clipShape(.rect(cornerRadius: 40))
                .padding(.horizontal)
                
                // TODO: Add button
                Button(K.tagsAddButtonLabel) {
                    
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


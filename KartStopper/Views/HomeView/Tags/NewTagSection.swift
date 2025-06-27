//
//  NewTagSection.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/05/25.
//

import SwiftUI
import SwiftData

struct NewTagSection: View {
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \TagModel.name, animation: .default) private var tags: [TagModel]
    
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
                
                // Add button
                Button {
                    if tagName != K.emptyString {
                        do {
                            let newTag = TagModel(name: tagName, color: UIColor(color))
                            
                            modelContext.insert(newTag)
                            
                            try modelContext.save()
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text(K.tagsAddButtonLabel)
                        .foregroundStyle(.gray100)
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
            .modelContainer(PersistenceController.preview)
    }
}


//
//  Tags.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI
import SwiftData

struct Tags: View {
    @Environment(\.dismiss) var dismiss
    
    @Query(sort: \TagModel.name, animation: .default) private var tags: [TagModel]
    
    let asHome: Bool
    
    var body: some View {
        List {
            // Editor
            NewTagSection()
            
            // Saved tags
            Section {
                if tags.isEmpty {
                    Text(K.tagsFillerText)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.tertiary)
                        .padding(.horizontal)
                } else {
                    if asHome {
                        ForEach(tags) { tag in
                            TagRow(tag: tag)
                        }
                    } else {
                        TagPicker(tags: tags)
                    }
                }
            } header:  {
                Text(K.tagsSavedTagsHeader)
            } footer: {
                if !tags.isEmpty && !asHome {
                    Text(K.tagsSavedTagsFooter)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(K.tagsTitle)
        .toolbarTitleDisplayMode(.inlineLarge)
        .toolbar {
            // Dismiss button
            ToolbarItem(placement: .topBarTrailing) {
                Button(K.closeButtonTitle, systemImage: K.closeButtonSymbol, action: {dismiss()})
                    .buttonStyle(.bordered)
                    .clipShape(.circle)
                    .foregroundStyle(.secondary)
                    .bold()
            }
        }
    }
}

#Preview {
    NavigationStack {
        Tags(asHome: false)
            .modelContainer(PersistenceController.preview)
    }
}

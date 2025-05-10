//
//  Tags.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI

struct Tags: View {
    @Environment(\.dismiss) var dismiss
    let asHome: Bool
    let tags = ListContainer().tags
    
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
                        ForEach(tags) {
                            TagRow(tag: $0)
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
            .listRowBackground(tags.isEmpty ? Color.clear : Color.white)
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
    }
}

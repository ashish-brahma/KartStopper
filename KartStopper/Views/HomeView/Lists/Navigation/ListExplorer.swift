//
//  ListExplorer.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI

struct ListExplorer: View {
    @State var showTags: Bool = false
    @State var searchText: String = K.emptyString
    @State private var multiSelection = Set<UUID>()
    
    @Binding var lists: ListContainer
    
    var filteredList: [ListModel] {
        if searchText.isEmpty {
            lists.data
        } else {
            lists.data.filter { item in
                item.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(.gray300)
                .ignoresSafeArea()
            
            VStack {
                if lists.data.isEmpty {
                    // No lists message
                    Text(K.listsFillerText)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.tertiary)
                    
                    // Call to action
                    Text(K.listsCTA)
                        .font(.subheadline)
                        .foregroundStyle(.tertiary)
                } else {
                    List(selection: $multiSelection) {
                        // Favourites section
                        Section {
                            NavigationLink {
                                Favourites(list: lists.getFavourites())
                            } label: {
                                HStack {
                                    Text(K.listsFavouritesRowTitle)
                                        .foregroundStyle(Color.foreground)
                                    
                                    Spacer()
                                    
                                    Text(String(lists.getFavouritesCount()))
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .selectionDisabled(true)
                        }
                        
                        // Saved lists section
                        Section {
                            ForEach(filteredList) { list in
                                NavigationLink {
                                    ListEditor(list: list)
                                } label: {
                                    ListRow(list: list)
                                }
                            }
                        } header: {
                            Text(K.listsSectionHeader)
                                .font(.title2)
                                .foregroundStyle(.accent)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
        .navigationTitle(K.listsNavigationTitle)
        .searchable(text: $searchText)
        .autocorrectionDisabled()
        .toolbar {
            // Add Tags button
            ToolbarItem(placement: .navigation) {
                Button(K.listsAddTagsButtonLabel, systemImage: K.listsAddTagsButtonImage) {
                    showTags.toggle()
                }
            }
            
            // Add List button
            ToolbarItem(placement: .topBarTrailing) {
                Button(K.listsAddListButtonLabel, systemImage: K.listsAddListButtonImage) {
                    // TODO: Add new item.
                }
            }
            
            // Edit button
            ToolbarItem(placement: .primaryAction) {
                EditButton()
            }
        }
        .sheet(isPresented: $showTags) {
            NavigationStack {
                Tags(asHome: true)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    @Previewable @State var lists = ListContainer()
    NavigationStack {
        ListExplorer(lists: $lists)
    }
}

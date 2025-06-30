//
//  ListExplorer.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI

struct ListExplorer: View {
    @State private var showTags: Bool = false
    @State private var searchText: String = K.emptyString
    @State private var newListName: String = K.emptyString
    @State private var multiSelection = Set<UUID>()
    
    var lists: [ListModel]
    
    var filteredList: [ListModel] {
        if searchText.isEmpty {
            lists
        } else {
            lists.filter { item in
                item.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var favourites: [ListItemModel] {
        var favourites = [ListItemModel]()
        for li in lists {
            favourites += (li.items.filter { $0.isFavourited })
        }
        return favourites
    }
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(.gray300)
                .ignoresSafeArea()
            
            VStack {
                if lists.isEmpty {
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
                                Favourites(list: favourites)
                            } label: {
                                HStack {
                                    Text(K.listsFavouritesRowTitle)
                                        .foregroundStyle(Color.foreground)
                                    
                                    Spacer()
                                    
                                    Text(String(favourites.count))
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
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        NavigationStack {
            ListExplorer(lists: [
                ListModel.listDistantPast,
                ListModel.listNow
            ])
        }
    }
}

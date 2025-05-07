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
    
    let lists: ListContainer
    
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
                    List {
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
                        }
                        
                        // Saved lists section
                        Section(header: Text(K.listsSectionHeader)
                            .font(.title2)
                            .foregroundStyle(.accent)) {
                                ListNavigator(lists: filteredList)
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
        }
        .sheet(isPresented: $showTags) {
            Tags()
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    NavigationStack {
        ListExplorer(lists: ListContainer())
    }
}

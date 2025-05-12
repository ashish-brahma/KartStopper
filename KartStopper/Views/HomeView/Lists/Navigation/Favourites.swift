//
//  Favourites.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/05/25.
//

import SwiftUI

struct Favourites: View {
    @State var searchText: String = K.emptyString
    @State private var multiSelection = Set<UUID>()
    
    let list: [ListItemModel]
    
    var filteredList: [ListItemModel] {
        if searchText.isEmpty {
            list
        } else {
            list.filter { item in
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
            
            // Favourite List
            VStack {
                if list.isEmpty {
                    Text(K.listsFavouritesFillerText)
                } else {
                    List(filteredList, selection: $multiSelection) {
                        ListItem(item: $0, list: filteredList, asFavourite: true)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .navigationTitle(K.listsFavouritesNavigationTitle)
        .searchable(text: $searchText)
        .autocorrectionDisabled()
        .animation(.default, value: searchText)
        .toolbar {
            EditButton()
        }
    }
}

#Preview {
    let lists = ListContainer()
    NavigationStack {
        Favourites(list: lists.getFavourites())
    }
}

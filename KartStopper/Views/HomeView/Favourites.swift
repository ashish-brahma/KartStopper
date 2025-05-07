//
//  Favourites.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/05/25.
//

import SwiftUI

struct Favourites: View {
    @State var searchText: String = K.emptyString
    
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
                .fill(.gray300.mix(with: .gray100, by: 0.5))
                .ignoresSafeArea()
            
            // Favourite List
            VStack {
                if list.isEmpty {
                    Text(K.listsFavouritesFillerText)
                } else {
                    List(filteredList) { item in
                        ListItem(item: item)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .navigationTitle(K.listsFavouritesNavigationTitle)
        .searchable(text: $searchText)
        .autocorrectionDisabled()
    }
}

#Preview {
    let lists = ListContainer()
    NavigationStack {
        Favourites(list: lists.getFavourites())
    }
}

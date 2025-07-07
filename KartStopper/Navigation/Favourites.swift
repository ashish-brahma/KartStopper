//
//  Favourites.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/05/25.
//

import SwiftUI

struct Favourites: View {
    @Environment(ViewModel.self) private var viewModel
    
    @State var searchText: String = K.emptyString
    @State private var multiSelection = Set<UUID>()
    
    var list: [ListItemModel]
    
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
                List(filteredList, selection: $multiSelection) {
                    ListItemRow(item: $0, list: filteredList, isSaved: true, asFavourite: true)
                }
                .listStyle(.plain)
                .overlay {
                    if list.isEmpty {
                        ContentUnavailableView {
                            Text(K.listsFavouritesFillerText)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.tertiary)
                        } description: {
                            Text(K.listsFavouritesCTA)
                                .font(.subheadline)
                                .foregroundStyle(.tertiary)
                        }
                    }
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
    let favsList = ListModel.listDistantPast.items.filter { $0.isFavourited }
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        NavigationStack {
            Favourites(list: favsList)
        }
    }
    .environment(ViewModel.preview)
}

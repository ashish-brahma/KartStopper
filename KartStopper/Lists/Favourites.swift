//
//  Favourites.swift
//  KartStopper
//
//  Created by Ashish Brahma on 07/05/25.
//

import SwiftUI
import SwiftData

/// The list of items which have been marked as favourite.
struct Favourites: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [ListItemModel]
    
    @State private var multiSelection = Set<UUID>()
    
    init(searchText: String = K.emptyString) {
        let predicate = ListItemModel.predicate(searchText: searchText)
        _items = Query(filter: predicate, sort: \.price, order: .reverse)
    }
    
    var body: some View {
        NavigationLink {
            ZStack {
                // Background
                Rectangle()
                    .fill(.gray300)
                    .ignoresSafeArea()
                
                // Favourite List
                // FIXME: Repeating items from different lists.
                VStack {
                    List(items, selection: $multiSelection) {
                        ListItemRow(item: $0, list: items, isSaved: true, asFavourite: true)
                    }
                    .listStyle(.plain)
                    .overlay {
                        if items.isEmpty {
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
            .toolbar {
                EditButton()
            }
            .navigationTitle(K.listsFavouritesNavigationTitle)
        } label: {
            HStack {
                Text(K.listsFavouritesRowTitle)
                    .foregroundStyle(Color.foreground)
                
                Spacer()
                
                Text(String(viewModel.totalFavourites))
                    .foregroundStyle(.secondary)
            }
        }
        .task {
            // Update view model to show count data.
            viewModel.update(modelContext: modelContext)
        }
    }
}

#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(.gray300)
                    .ignoresSafeArea()
                
                List {
                    Favourites()
                }
                .listStyle(.plain)
            }
            .navigationTitle(K.listsNavigationTitle)
        }
    }
    .environment(ViewModel.preview)
}

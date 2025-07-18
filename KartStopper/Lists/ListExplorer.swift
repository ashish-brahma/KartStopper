//
//  ListExplorer.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI
import SwiftData

/// The explorer view to navigate all saved lists.
struct ListExplorer: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    @Query private var lists: [ListModel]
    
    @State private var showTags: Bool = false
    @State private var multiSelection = Set<UUID>()
    
    init(
        searchText: String = K.emptyString,
        searchDate: Date? = nil
    ) {
        _lists = Query(filter: ListModel.predicate(
                            searchText: searchText,
                            searchDate: searchDate),
                       sort: \.date,
                       order: .reverse,
                       animation: .default)
    }
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        ZStack {
            // Background
            Rectangle()
                .fill(.gray300)
                .ignoresSafeArea()
            
            VStack {
                List(selection: $multiSelection) {
                    if !lists.isEmpty {
                        Section {
                            Favourites(searchText: viewModel.searchText)
                                .selectionDisabled(true)
                        }
                    }
                    
                    // Saved lists
                    Section {
                        ForEach(lists) { list in
                            NavigationLink {
                                ListEditor(searchText: viewModel.searchText,
                                           listName: list.name)
                                .searchable(text: $viewModel.searchText)
                                .autocorrectionDisabled()
                            } label: {
                                ListRow(list: list)
                            }
                        }
                    } header: {
                        if !lists.isEmpty {
                            Text(K.listsSectionHeader)
                                .font(.title2)
                                .foregroundStyle(.accent)
                        }
                    }
                }
                .listStyle(.plain)
                .overlay {
                    if viewModel.totalLists == 0 {
                        ContentUnavailableView {
                            Text(K.listsFillerText)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.tertiary)
                        } description: {
                            Text(K.listsCTA)
                                .font(.subheadline)
                                .foregroundStyle(.tertiary)
                        }
                    } else if lists.isEmpty {
                        ContentUnavailableView.search
                    }
                }
            }
        }
        .navigationTitle(K.listsNavigationTitle)
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
            ListExplorer()
        }
    }
    .environment(ViewModel.preview)
}

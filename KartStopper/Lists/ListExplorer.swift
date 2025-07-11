//
//  ListExplorer.swift
//  KartStopper
//
//  Created by Ashish Brahma on 06/04/25.
//

import SwiftUI
import SwiftData

/// The explorer view to see all saved lists.
struct ListExplorer: View {
    @Environment(ViewModel.self) private var viewModel
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ListModel.date, animation: .default) private var lists: [ListModel]
    
    @State private var showTags: Bool = false
    @State private var multiSelection = Set<UUID>()
    
    init(
        searchText: String = K.emptyString,
        searchDate: Date = .now
    ) {
        _lists = Query(filter: ListModel.predicate(
                            searchText: searchText,
                            searchDate: searchDate),
                       sort: \.date,
                       order: .reverse)
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
                    Section {
                        Favourites(searchText: viewModel.searchText)
                            .searchable(text: $viewModel.searchText)
                            .autocorrectionDisabled()
                            .selectionDisabled(true)
                    }
                    
                    // Saved lists section
                    Section {
                        ForEach(lists) { list in
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
                .overlay {
                    if lists.isEmpty {
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

//
//  ListItems.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/05/25.
//

import SwiftUI
import SwiftData

/// A view to navigate and edit items in a shopping list.
struct ListEditor: View {
    @Environment(ViewModel.self) private var viewModel
    @Query var items: [ListItemModel]
    
    let listName: String
    @State var showTags = false
    @State var newItem = K.emptyString
    @State private var multiSelection = Set<UUID>()
    
    var totalAmount: Double {
        var amt = 0.0
        items.forEach { item in
            amt += item.price * Double(item.numUnits)
        }
        return amt
    }
    
    init(
        searchText: String = K.emptyString,
        listName: String
    ) {
        self.listName = listName
        let predicate = #Predicate<ListItemModel> { item in
            (item.lists.contains { $0.name == listName })
            &&
            (searchText.isEmpty || item.name.localizedStandardContains(searchText))
        }
        _items = Query(filter: predicate)
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
                    // Saved list items
                    Section {
                        ForEach(items) { item in
                            Label {
                                VStack {
                                    ListItemRow(item: item, list: items)
                                    SKU(count: item.numUnits)
                                        .padding(.top, -32)
                                }
                            } icon : {
                                Image(systemName: K.listsCheckCircleSymbol)
                                    .padding([.leading, .trailing])
                                    .foregroundStyle(.accent)
                            }
                        }
                    }
                    
                    // New item search field
                    Section {
                        Label {
                            TextField(K.listsSearchPlaceholderLabel, text: $newItem)
                                .textFieldStyle(.plain)
                        } icon : {
                            Image(systemName: K.listsCheckCircleSymbol)
                                .padding([.leading, .trailing])
                                .foregroundStyle(.accent)
                        }
                        .padding(.top, 12)
                    }
                    .listRowBackground(Color.clear)
                    .listSectionSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .navigationTitle(listName)
            .toolbar {
                // Edit Button
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                }
                
                // Add Tags button
                ToolbarItem(placement: .navigation) {
                    Button(K.listsAddTagsButtonLabel, systemImage: K.listsAddTagsButtonImage) {
                        showTags.toggle()
                    }
                }
                
                // Running total
                ToolbarItem(placement: .principal) {
                    Text(K.listsTotalCostLabel
                         + viewModel.budget.currencySymbol + K.spaceString
                         + String(format: K.decimalFormat, totalAmount))
                        .foregroundStyle(Color.foreground)
                }
            }
            .sheet(isPresented: $showTags) {
                NavigationStack {
                    Tags(asHome: false)
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer) {
        NavigationStack {
            ListEditor(listName: ListModel.listDistantPast.name)
        }
    }
    .environment(ViewModel.preview)
}

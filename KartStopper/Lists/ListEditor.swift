//
//  ListItems.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/05/25.
//

import SwiftUI

struct ListEditor: View {
    @Environment(ViewModel.self) private var viewModel
    @State var searchText = K.emptyString
    @State var newItem = K.emptyString
    @State var showTags = false
    @State private var multiSelection = Set<UUID>()
    
    var list: ListModel
    
    var filteredList: [ListItemModel] {
        if searchText.isEmpty {
            list.items
        } else {
            list.items.filter { item in
                item.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var totalAmount: Double {
        var amt = 0.00
        list.items.forEach { item in
            amt += item.price * Double(item.numUnits)
        }
        return amt
    }
    
    var body: some View {
        ZStack {
            // Background
            Rectangle()
                .fill(.gray300)
                .ignoresSafeArea()
            
            VStack {
                List(selection: $multiSelection) {
                    // Saved list items
                    Section {
                        ForEach(filteredList) { item in
                            Label {
                                ListItemRow(item: item, list: filteredList,isSaved: true, asFavourite: false)
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
                    
                    // TODO: Search results
                    Section {
                        
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(list.name)
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
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
            ListEditor(list: ListModel.listDistantPast)
        }
    }
    .environment(ViewModel.preview)
}

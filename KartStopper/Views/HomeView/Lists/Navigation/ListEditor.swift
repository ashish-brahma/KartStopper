//
//  ListItems.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/05/25.
//

import SwiftUI

struct ListEditor: View {
    @State var searchText = K.emptyString
    @State var newItem = K.emptyString
    @State var showTags = false
    @State private var multiSelection = Set<UUID>()
    
    let list: ListModel
    
    var filteredList: [ListItemModel] {
        if searchText.isEmpty {
            list.content
        } else {
            list.content.filter { item in
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
                List(selection: $multiSelection) {
                    // Saved list items
                    Section {
                        ForEach(filteredList) { item in
                            Label {
                                ListItem(item: item, list: filteredList,isSaved: true, asFavourite: false)
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
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                }
                
                // Add Tags button
                ToolbarItem(placement: .navigation) {
                    Button(K.listsAddTagsButtonLabel, systemImage: K.listsAddTagsButtonImage) {
                        showTags.toggle()
                    }
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
    @Previewable @State var lists = ListContainer()
    NavigationStack {
        ListEditor(list: lists.data[0])
    }
}

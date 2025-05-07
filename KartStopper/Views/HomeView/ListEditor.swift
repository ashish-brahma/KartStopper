//
//  ListItems.swift
//  KartStopper
//
//  Created by Ashish Brahma on 01/05/25.
//

import SwiftUI

struct ListEditor: View {
    let list: ListModel
    @State var searchText = K.emptyString
    @State private var multiSelection = Set<UUID>()
    
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
            
            // List Items
            VStack {
                List(filteredList, selection: $multiSelection) { item in
                    ListItem(item: item)
                }
                .listStyle(.plain)
                
                // TODO: Use inline search bar on keyboard.
                NewItemField()
                
                Spacer()
            }
            .navigationTitle(list.name)
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    let lists = ListContainer()
    ListEditor(list: lists.data[0])
}
